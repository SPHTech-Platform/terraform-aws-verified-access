resource "aws_verifiedaccess_trust_provider" "this" {
  description              = "${var.trust_provider_type} based trust provider"
  policy_reference_name    = var.policy_reference_name
  trust_provider_type      = var.trust_provider_type
  user_trust_provider_type = var.user_trust_provider_type

  dynamic "oidc_options" {
    for_each = var.user_trust_provider_type == "oidc" ? [1] : []
    content {
      authorization_endpoint = var.authorization_endpoint
      client_id              = var.client_id
      client_secret          = var.client_secret
      issuer                 = var.issuer
      scope                  = var.scope
      token_endpoint         = var.token_endpoint
      user_info_endpoint     = var.user_info_endpoint
    }
  }

  tags = var.tags
}

resource "aws_verifiedaccess_instance" "this" {
  description = "Verified access instance"
  tags        = var.tags
}

resource "aws_verifiedaccess_instance_trust_provider_attachment" "this" {
  verifiedaccess_instance_id       = aws_verifiedaccess_instance.this.id
  verifiedaccess_trust_provider_id = aws_verifiedaccess_trust_provider.this.id
}

resource "aws_verifiedaccess_group" "this" {
  verifiedaccess_instance_id = aws_verifiedaccess_instance.this.id
  policy_document            = var.group_policy_document != null ? var.group_policy_document : null
  tags                       = var.tags

  # Must attach a TrustProvider to Instance before you can create a Group
  depends_on = [
    aws_verifiedaccess_instance_trust_provider_attachment.this
  ]
}
