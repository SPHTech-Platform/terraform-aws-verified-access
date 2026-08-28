resource "aws_verifiedaccess_instance_logging_configuration" "this" {

  count = var.enable_logging ? 1 : 0

  access_logs {
    cloudwatch_logs {
      enabled   = var.cloudwatch_logs.enable
      log_group = aws_cloudwatch_log_group.cloudwatch_log_group[0].arn
    }

    kinesis_data_firehose {
      enabled         = var.kinesis_data_firehose.enable
      delivery_stream = var.kinesis_data_firehose.delivery_stream
    }

    s3 {
      enabled      = var.s3_logs.enable
      bucket_name  = var.s3_logs.bucket_name
      bucket_owner = var.s3_logs.bucket_owner
      prefix       = var.s3_logs.prefix
    }

    log_version           = var.log_version
    include_trust_context = var.include_trust_context
  }

  verifiedaccess_instance_id = var.aws_verifiedaccess_instance

}

resource "aws_cloudwatch_log_group" "cloudwatch_log_group" {
  #checkov:skip=CKV_AWS_338:Ensure CloudWatch log groups retains logs for at least 1 year
  count             = var.create_cloudwatch_log_group && var.enable_logging ? 1 : 0
  name              = var.cloudwatch_log_group_name
  kms_key_id        = aws_kms_key.log_encryption_key.arn
  retention_in_days = var.log_retention_in_days
}
