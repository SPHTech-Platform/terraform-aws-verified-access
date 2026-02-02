#Setup AWS Verified Access with IAM Identity Center provider
module "verified_access_iam_identity_center" {
  source = "../"

  policy_reference_name    = "IAM"
  trust_provider_type      = "user"
  user_trust_provider_type = "iam-identity-center"

  group_policy_document = <<-EOT
    permit(principal, action, resource)
      when {
       context.IAM.user.email.address like "*@abc.com"
      };
  EOT

  tags = {
    Name = "IAM-Identity-Center"
  }
}

#Setup AWS Verified Access with OIDC provider
module "verified_access_oidc" {
  source = "../"

  policy_reference_name    = "OKTA"
  trust_provider_type      = "user"
  user_trust_provider_type = "oidc"

  authorization_endpoint = "https://dev-12345678.okta.com/oauth2/v1/authorize"
  client_id              = "test-client-id"
  client_secret          = "sdfdf333000000"
  issuer                 = "https://dev-12345678.okta.com"
  scope                  = "openid profile groups"
  token_endpoint         = "https://dev-12345678.okta.com/oauth2/v1/token"
  user_info_endpoint     = "https://dev-12345678.okta.com/oauth2/v1/userinfo"

  group_policy_document = <<-EOT
    permit(principal, action, resource)
      when {
      context.http_request.http_method != "INVALID_METHOD"
      };
  EOT

  tags = {
    Name = "OIDC"
  }
}

#AWS Verified Access Endpoints

#Network Interface Endpoint Type
module "verified_access_eni_endpoint" {
  source = "../modules/endpoint"

  verified_access_group_id = module.verified_access_iam_identity_center.verifiedaccess_group_id

  description            = "example"
  application_domain     = "example.my-domain.com"
  domain_certificate_arn = module.acm.acm_certificate_arn
  endpoint_domain_prefix = "example"
  security_group_ids     = [module.verified_access_sg.security_group_id]

  endpoint_type        = "network-interface"
  network_interface_id = "eni-xys3d2c29ad06"
  port                 = 443
  protocol             = "https"

  tags = {
    Name = "Example verified access endpoint"
  }
}

#Internal Load Balancer Endpoint Type
module "verified_access_elb_endpoint" {
  source = "../modules/endpoint"

  verified_access_group_id = module.verified_access_oidc.verifiedaccess_group_id

  description = "Example"

  application_domain     = "example.my-domain.com"
  domain_certificate_arn = module.acm.acm_certificate_arn
  endpoint_domain_prefix = "example"
  security_group_ids     = [module.verified_access_sg.security_group_id]

  endpoint_type     = "load-balancer"
  load_balancer_arn = module.alb.arn
  port              = 443
  protocol          = "https"
  subnet_ids        = module.vpc.private_subnets

  tags = {
    Name = "Example verified access endpoint"
  }
}

module "vpc" {
  #checkov:skip=CKV2_AWS_12:Ensure the default security group of every VPC restricts all traffic
  source  = "terraform-aws-modules/vpc/aws"
  version = "~> 5.1"

  name = "test-vpc"
  cidr = "10.0.0.0/16"

  azs             = ["ap-southeast-1a", "ap-southeast-1b", "ap-southeast-1c"]
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  public_subnets  = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]

  enable_nat_gateway = true
  enable_vpn_gateway = true

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}

module "verified_access_sg" {
  #checkov:skip=CKV2_AWS_5:Ensure that Security Groups are attached to another resource
  source  = "terraform-aws-modules/security-group/aws"
  version = "~> 5.1"

  name   = "verified-access-sg"
  vpc_id = module.vpc.vpc_id

  ingress_cidr_blocks = ["0.0.0.0/0"]

  ingress_rules = [
    "https-443-tcp"
  ]

  egress_rules = ["all-all"]
}

module "acm" {
  #checkov:skip=CKV2_AWS_71:Ensure AWS ACM Certificate domain name does not include wildcards
  source  = "terraform-aws-modules/acm/aws"
  version = "~> 4.0"

  domain_name = "my-domain.com"
  zone_id     = "xyz1234B9AZ6SHAE"

  validation_method = "DNS"

  subject_alternative_names = [
    "*.my-domain.com"
  ]

  wait_for_validation = true

  tags = {
    Name = "my-domain.com"
  }
}

module "alb" {
  #checkov:skip=CKV_AWS_2:Ensure ALB protocol is HTTPS
  source  = "terraform-aws-modules/alb/aws"
  version = "~> 9.1"

  name     = "my-alb"
  vpc_id   = module.vpc.vpc_id
  subnets  = module.vpc.private_subnets
  internal = true

  # Allow traffic from Verified Access security group
  security_groups = [module.verified_access_sg.security_group_id]

  listeners = {
    https = {
      port            = 443
      protocol        = "HTTPS"
      certificate_arn = module.acm.acm_certificate_arn
      forward = {
        target_group_key = "ex-instance"
      }
    }
  }

  tags = {
    Environment = "Development"
    Project     = "Example"
  }
}
