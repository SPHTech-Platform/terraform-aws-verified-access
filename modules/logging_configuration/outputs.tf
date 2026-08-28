output "kms_key_arn" {
  value       = aws_kms_key.log_encryption_key.arn
  description = "KMS key ARN for encryption"
}

output "cloudwatch_log_group_name" {
  value       = var.cloudwatch_log_group_name
  description = "CloudWatch Log Group for AVA logging."
}
