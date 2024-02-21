#Logging
variable "enable_logging" {
  description = "Enable/disable logging config"
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
  description = "Log version for AVA logs"
  type        = string
  default     = ""
}

variable "include_trust_context" {
  description = "Trust providers in AVA logs"
  type        = bool
  default     = false
}

#Cloudwatch Log group
variable "create_cloudwatch_log_group" {
  description = "Enable/disable CloudWatch Log Group, if false provide existing group"
  type        = bool
  default     = true
}

variable "override_cloudwatch_log_group_name" {
  type        = string
  description = "Existing CW log group name (optional)"
  default     = ""
}

variable "log_retention_in_days" {
  description = "Retain logs in the CW Log Group."
  type        = number
  default     = 90
}

variable "enable_kms_key_rotation" {
  description = "enable/disable automatic rotation of the KMS key"
  type        = bool
  default     = true
}

variable "kms_key_deletion_window_in_days" {
  description = "The wait period(days) before rotating"
  type        = number
  default     = 10
}
