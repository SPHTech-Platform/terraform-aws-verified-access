output "kms_key_arn" {
  value       = aws_kms_key.log_encryption_key.arn
  description = "The ARN of the KMS key used for encrypting the CloudWatch logs."
}

output "cloudwatch_log_group_name" {
  value       = aws_cloudwatch_log_group.cloudwatch_log_group[0].name
  description = "The name of the CloudWatch Log Group used for AWS Verified Access logging."
}
