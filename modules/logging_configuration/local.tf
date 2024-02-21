# tflint-ignore: terraform_unused_declarations
locals {
  cloudwatch_log_group_name = var.enable_logging ? (var.override_cloudwatch_log_group_name != "" ? var.override_cloudwatch_log_group_name : aws_cloudwatch_log_group.cloudwatch_log_group[0].arn) : ""
  account_id = data.aws_caller_identity.current.account_id
  aws_region = data.aws_region.current.name
}
