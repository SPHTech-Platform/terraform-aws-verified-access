resource "aws_verifiedaccess_endpoint" "this" {
  description            = var.description
  application_domain     = var.application_domain
  domain_certificate_arn = var.domain_certificate_arn

  verified_access_group_id = var.verified_access_group_id

  attachment_type        = var.attachment_type
  endpoint_domain_prefix = var.endpoint_domain_prefix
  security_group_ids     = var.security_group_ids
  endpoint_type          = var.endpoint_type

  dynamic "network_interface_options" {
    for_each = var.endpoint_type == "network-interface" ? [1] : []
    content {
      network_interface_id = var.network_interface_id
      port                 = var.port
      protocol             = var.protocol
    }
  }

  dynamic "load_balancer_options" {
    for_each = var.endpoint_type == "load-balancer" ? [1] : []
    content {
      load_balancer_arn = var.load_balancer_arn
      port              = var.port
      protocol          = var.protocol
      subnet_ids        = var.subnet_ids
    }
  }

  tags = var.tags
}
