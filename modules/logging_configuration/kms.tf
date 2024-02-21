resource "aws_kms_key" "log_encryption_key" {
  description             = "KMS key for encrypting CloudWatch logs of AWS Verified Access."
  deletion_window_in_days = var.kms_key_deletion_window_in_days
  enable_key_rotation     = var.enable_kms_key_rotation

  policy = data.aws_iam_policy_document.cloudwatch_log_group.json
}

resource "aws_kms_alias" "key" {
  count = var.alias != null && var.alias != "" ? 1 : 0

  name          = var.alias
  target_key_id = aws_kms_key.log_encryption_key.key_id
}


################
# KMS policy to allow cloudwatch log groups
################
data "aws_iam_policy_document" "cloudwatch_log_group" {
  #checkov:skip=CKV_AWS_283=Ensure no IAM policies documents allow ALL or any AWS principal permissions to the resource
  #checkov:skip=CKV_AWS_111=Ensure IAM policies does not allow write access without constraints
  #checkov:skip=CKV_AWS_109: "Ensure IAM policies does not allow permissions management (only give for describe key)"
  #checkov:skip=CKV_AWS_356:Ensure IAM policies limit resource access
  statement {
    sid = "Add permission to cw to access KMS key"

    principals {
      type = "AWS"
      identifiers = [
        "*"
      ]
    }
    actions = [
      "kms:Encrypt*",
      "kms:Decrypt*",
      "kms:ReEncrypt*",
      "kms:GenerateDataKey*",
      "kms:Describe*"
    ]
    resources = ["*"]
    condition {
      test     = "ArnLike"
      variable = "kms:EncryptionContext:aws:logs:arn"
      values   = ["arn:aws:logs:${local.aws_region}:${local.account_id}:log-group:*"]
    }
  }
}
