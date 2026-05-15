## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 5.24 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 5.24 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_cloudwatch_log_group.cloudwatch_log_group](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_group) | resource |
| [aws_kms_alias.key](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kms_alias) | resource |
| [aws_kms_key.log_encryption_key](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kms_key) | resource |
| [aws_verifiedaccess_instance_logging_configuration.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/verifiedaccess_instance_logging_configuration) | resource |
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |
| [aws_iam_policy_document.cloudwatch_log_group](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_region.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/region) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_alias"></a> [alias](#input\_alias) | Alias for kms key | `string` | `"alias/ava/loggroup"` | no |
| <a name="input_aws_verifiedaccess_instance"></a> [aws\_verifiedaccess\_instance](#input\_aws\_verifiedaccess\_instance) | Verified access Instance to be associated with logging | `string` | `""` | no |
| <a name="input_cloudwatch_log_group_name"></a> [cloudwatch\_log\_group\_name](#input\_cloudwatch\_log\_group\_name) | New CW log group name if creating a new group | `string` | `"default-ava-cloudwatch-loggroup"` | no |
| <a name="input_cloudwatch_logs"></a> [cloudwatch\_logs](#input\_cloudwatch\_logs) | Configuration for CloudWatch logs | <pre>object({<br>    enable    = bool<br>    log_group = string<br>  })</pre> | <pre>{<br>  "enable": false,<br>  "log_group": ""<br>}</pre> | no |
| <a name="input_create_cloudwatch_log_group"></a> [create\_cloudwatch\_log\_group](#input\_create\_cloudwatch\_log\_group) | Enable/disable CloudWatch Log Group, if false provide existing group | `bool` | `false` | no |
| <a name="input_enable_kms_key_rotation"></a> [enable\_kms\_key\_rotation](#input\_enable\_kms\_key\_rotation) | enable/disable automatic rotation of the KMS key | `bool` | `true` | no |
| <a name="input_enable_logging"></a> [enable\_logging](#input\_enable\_logging) | Enable/disable logging config | `bool` | `false` | no |
| <a name="input_include_trust_context"></a> [include\_trust\_context](#input\_include\_trust\_context) | Trust providers in AVA logs | `bool` | `false` | no |
| <a name="input_kinesis_data_firehose"></a> [kinesis\_data\_firehose](#input\_kinesis\_data\_firehose) | Configuration for Kinesis Data Firehose logs | <pre>object({<br>    enable          = bool<br>    delivery_stream = string<br>  })</pre> | <pre>{<br>  "delivery_stream": "",<br>  "enable": false<br>}</pre> | no |
| <a name="input_kms_key_deletion_window_in_days"></a> [kms\_key\_deletion\_window\_in\_days](#input\_kms\_key\_deletion\_window\_in\_days) | The wait period(days) before rotating | `number` | `10` | no |
| <a name="input_log_retention_in_days"></a> [log\_retention\_in\_days](#input\_log\_retention\_in\_days) | Retain logs in the CW Log Group. | `number` | `90` | no |
| <a name="input_log_version"></a> [log\_version](#input\_log\_version) | Log version for AVA logs | `string` | `""` | no |
| <a name="input_override_cloudwatch_log_group_name"></a> [override\_cloudwatch\_log\_group\_name](#input\_override\_cloudwatch\_log\_group\_name) | Existing CW log group name (optional) | `string` | `""` | no |
| <a name="input_s3_logs"></a> [s3\_logs](#input\_s3\_logs) | Configuration for S3 logs | <pre>object({<br>    enable       = bool<br>    bucket_name  = string<br>    bucket_owner = optional(number)<br>    prefix       = string<br>  })</pre> | <pre>{<br>  "bucket_name": "",<br>  "enable": false,<br>  "prefix": ""<br>}</pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_cloudwatch_log_group_name"></a> [cloudwatch\_log\_group\_name](#output\_cloudwatch\_log\_group\_name) | CloudWatch Log Group for AVA logging. |
| <a name="output_kms_key_arn"></a> [kms\_key\_arn](#output\_kms\_key\_arn) | KMS key ARN for encryption |
