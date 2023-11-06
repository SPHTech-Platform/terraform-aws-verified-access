#Setup AWS Verified Access with IAM Identity Center provider
module "verified_access_iam_identity_center" {
  source = "../"

  policy_reference_name    = "IAM"
  trust_provider_type      = "user"
  user_trust_provider_type = "iam-identity-center"

  group_policy_document = <<EOT
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

  group_policy_document = <<EOT
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

  application_name       = "user-manager"
  application_domain     = "user-manger.abc.com"
  domain_certificate_arn = "arn:aws:acm:ap-southeast-1:12345678:certificate/a6e8cc16-b740-4e15-8a3a-a3f643589a36"
  endpoint_domain_prefix = "user-manger"
  security_group_ids     = ["sg-090fee8d4dd093"]

  endpoint_type        = "network-interface"
  network_interface_id = "eni-0ecf3d2c29ad06"
  port                 = 443
  protocol             = "https"

  tags = {
    Name = "User manager endpoint"
  }
}

#Internal Load Balancer Endpoint Type
module "verified_access_elb_endpoint" {
  source = "../modules/endpoint"

  verified_access_group_id = module.verified_access_oidc.verifiedaccess_group_id

  application_name = "student-portal"

  application_domain     = "student-portal.abc.com"
  domain_certificate_arn = "arn:aws:acm:ap-southeast-1:123789456:certificate/a6e8cc16-b740-4e15-8a3a-a3f643589a36"
  endpoint_domain_prefix = "student-portal"
  security_group_ids     = ["sg-0305d43dd3458dda"]

  endpoint_type     = "load-balancer"
  load_balancer_arn = "arn:aws:elasticloadbalancing:ap-southeast-1:123456789:loadbalancer/app/student-portal/db28c751e6407a7e"
  port              = 443
  protocol          = "https"
  subnet_ids = [
    "subnet-0589f70e50ee83b4",
    "subnet-080006967a027df"
  ]

  tags = {
    Name = "student-portal"
  }
}
