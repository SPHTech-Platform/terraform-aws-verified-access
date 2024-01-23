<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 5.24 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.24.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_verifiedaccess_endpoint.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/verifiedaccess_endpoint) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_application_domain"></a> [application\_domain](#input\_application\_domain) | The DNS name for users to reach your application. | `string` | n/a | yes |
| <a name="input_attachment_type"></a> [attachment\_type](#input\_attachment\_type) | The type of attachment. Currently, only vpc is supported. | `string` | `"vpc"` | no |
| <a name="input_description"></a> [description](#input\_description) | The description for verified application | `string` | `null` | no |
| <a name="input_domain_certificate_arn"></a> [domain\_certificate\_arn](#input\_domain\_certificate\_arn) | The ARN of the public TLS/SSL certificate in AWS Certificate Manager to associate with the endpoint | `string` | n/a | yes |
| <a name="input_endpoint_domain_prefix"></a> [endpoint\_domain\_prefix](#input\_endpoint\_domain\_prefix) | A custom identifier that is prepended to the DNS name that is generated for the endpoint | `string` | n/a | yes |
| <a name="input_endpoint_type"></a> [endpoint\_type](#input\_endpoint\_type) | The type of Verified Access endpoint to create. Currently load-balancer or network-interface are supported. | `string` | n/a | yes |
| <a name="input_load_balancer_arn"></a> [load\_balancer\_arn](#input\_load\_balancer\_arn) | The ARN of the internal load balancer. | `string` | `null` | no |
| <a name="input_network_interface_id"></a> [network\_interface\_id](#input\_network\_interface\_id) | The ID of the network interface | `string` | `null` | no |
| <a name="input_port"></a> [port](#input\_port) | The IP port number. | `number` | `null` | no |
| <a name="input_protocol"></a> [protocol](#input\_protocol) | The IP protocol. | `string` | `null` | no |
| <a name="input_security_group_ids"></a> [security\_group\_ids](#input\_security\_group\_ids) | List of the the security groups IDs to associate with the Verified Access endpoint. | `list(string)` | n/a | yes |
| <a name="input_subnet_ids"></a> [subnet\_ids](#input\_subnet\_ids) | The IDs of the subnets. | `list(string)` | `[]` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Key-value mapping of resource tags. | `map(string)` | `{}` | no |
| <a name="input_verified_access_group_id"></a> [verified\_access\_group\_id](#input\_verified\_access\_group\_id) | The ID of the Verified Access group to associate the endpoint with. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_endpoint_domain"></a> [endpoint\_domain](#output\_endpoint\_domain) | A DNS name that is generated for the endpoint. |
| <a name="output_endpoint_id"></a> [endpoint\_id](#output\_endpoint\_id) | The ID of the AWS Verified Access endpoint. |
| <a name="output_instance_id"></a> [instance\_id](#output\_instance\_id) | The ID of the AWS Verified Access instance. |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
