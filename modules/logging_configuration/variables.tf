#Logging
variable "enable_logging" {
  description = "Enable or disable logging configurations entirely."
  type        = bool
  default     = false
}

variable "aws_verifiedaccess_instance" {
  description = "Verified access Instance to be associated with logging"
  type        = string
  default     = ""
}

variable "cloudwatch_logs" {
  description = "Configuration for CloudWatch logs"
  type = object({
    enable    = bool
    log_group = string
  })
  default = {
    enable    = false
    log_group = ""
  }
}

variable "kinesis_data_firehose" {
  description = "Configuration for Kinesis Data Firehose logs"
  type = object({
    enable          = bool
    delivery_stream = string
  })
  default = {
    enable          = false
    delivery_stream = ""
  }
}

variable "s3_logs" {
  description = "Configuration for S3 logs"
  type = object({
    enable       = bool
    bucket_name  = string
    bucket_owner = optional(number)
    prefix       = string
  })
  default = {
    enable      = false
    bucket_name = ""
    prefix      = ""
  }
}

variable "log_version" {
  description = "Log version for Verified Access logs"
  type        = string
  default     = ""
}

variable "include_trust_context" {
  description = "Include claims from trust providers in Verified Access logs"
  type        = bool
  default     = false
}

#Cloudwatch Log group
variable "create_cloudwatch_log_group" {
  description = "Whether to create a new CloudWatch Log Group, if false provide existing group"
  type        = bool
  default     = true
}

variable "cloudwatch_log_group_name" {
  description = "The name of the CloudWatch Log Group for AWS Verified Access logging."
  type        = string
  default     = ""
}

variable "override_cloudwatch_log_group_name" {
  type        = string
  description = "To use a different cloudwatch log group (optional)"
  default     = ""
}


variable "log_retention_in_days" {
  description = "The number of days to retain logs in the CloudWatch Log Group."
  type        = number
  default     = 90
}

variable "enable_kms_key_rotation" {
  description = "Whether to enable automatic rotation of the KMS key used for encrypting CloudWatch logs."
  type        = bool
  default     = true
}

variable "kms_key_deletion_window_in_days" {
  description = "The waiting period, in days, before the KMS key is deleted after it is scheduled for deletion."
  type        = number
  default     = 10
}
