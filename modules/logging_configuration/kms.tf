resource "aws_kms_key" "log_encryption_key" {
  description             = "KMS key for encrypting CloudWatch logs of AWS Verified Access."
  deletion_window_in_days = var.kms_key_deletion_window_in_days
  enable_key_rotation     = var.enable_kms_key_rotation
}
