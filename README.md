# Terraform AWS Verified Access

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.10 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 6.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 6.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_verifiedaccess_group.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/verifiedaccess_group) | resource |
| [aws_verifiedaccess_instance.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/verifiedaccess_instance) | resource |
| [aws_verifiedaccess_instance_trust_provider_attachment.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/verifiedaccess_instance_trust_provider_attachment) | resource |
| [aws_verifiedaccess_trust_provider.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/verifiedaccess_trust_provider) | resource |
| [aws_region.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/region) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_authorization_endpoint"></a> [authorization\_endpoint](#input\_authorization\_endpoint) | The OIDC authorization endpoint. | `string` | `null` | no |
| <a name="input_client_id"></a> [client\_id](#input\_client\_id) | The client identifier. | `string` | `null` | no |
| <a name="input_client_secret"></a> [client\_secret](#input\_client\_secret) | The client secret. | `string` | `null` | no |
| <a name="input_group_policy_document"></a> [group\_policy\_document](#input\_group\_policy\_document) | he policy document that is associated with this resource. | `string` | `null` | no |
| <a name="input_issuer"></a> [issuer](#input\_issuer) | The OIDC issuer. | `string` | `null` | no |
| <a name="input_policy_reference_name"></a> [policy\_reference\_name](#input\_policy\_reference\_name) | The type of trust provider can be either user or device-based. | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | Region where resources will be created. | `string` | `null` | no |
| <a name="input_scope"></a> [scope](#input\_scope) | OpenID Connect (OIDC) scopes are used by an application during authentication to authorize access to details of a user. | `string` | `null` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Key-value mapping of resource tags. | `map(string)` | `{}` | no |
| <a name="input_token_endpoint"></a> [token\_endpoint](#input\_token\_endpoint) | The OIDC token endpoint. | `string` | `null` | no |
| <a name="input_trust_provider_type"></a> [trust\_provider\_type](#input\_trust\_provider\_type) | The type of trust provider can be either user or device-based. | `string` | n/a | yes |
| <a name="input_user_info_endpoint"></a> [user\_info\_endpoint](#input\_user\_info\_endpoint) | The OIDC user info endpoint. | `string` | `null` | no |
| <a name="input_user_trust_provider_type"></a> [user\_trust\_provider\_type](#input\_user\_trust\_provider\_type) | The type of user-based trust provider. | `string` | `"iam-identity-center"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_instance_id"></a> [instance\_id](#output\_instance\_id) | The ID of the Verified Access instance. |
| <a name="output_verifiedaccess_group_arn"></a> [verifiedaccess\_group\_arn](#output\_verifiedaccess\_group\_arn) | The ID of the Verified Access group to associate the endpoint with. |
| <a name="output_verifiedaccess_group_id"></a> [verifiedaccess\_group\_id](#output\_verifiedaccess\_group\_id) | The ID of the Verified Access group to associate the endpoint with. |
