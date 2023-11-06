variable "description" {
  description = "The description for verified application"
  type        = string
  default     = null
}

variable "verified_access_group_id" {
  description = "The ID of the Verified Access group to associate the endpoint with."
  type        = string
}

variable "application_domain" {
  description = "The DNS name for users to reach your application."
  type        = string
}

variable "domain_certificate_arn" {
  description = "The ARN of the public TLS/SSL certificate in AWS Certificate Manager to associate with the endpoint"
  type        = string
}

variable "attachment_type" {
  description = "The type of attachment. Currently, only vpc is supported."
  type        = string
  default     = "vpc"
}

variable "endpoint_domain_prefix" {
  description = "A custom identifier that is prepended to the DNS name that is generated for the endpoint"
  type        = string
}

variable "security_group_ids" {
  description = "List of the the security groups IDs to associate with the Verified Access endpoint."
  type        = list(string)
}

variable "endpoint_type" {
  description = "The type of Verified Access endpoint to create. Currently load-balancer or network-interface are supported. "
  type        = string
}

variable "network_interface_id" {
  description = "The ID of the network interface"
  type        = string
  default     = null
}

variable "port" {
  description = "The IP port number."
  type        = number
  default     = null
}

variable "protocol" {
  description = "The IP protocol."
  type        = string
  default     = null
}

variable "load_balancer_arn" {
  description = "The ARN of the internal load balancer."
  type        = string
  default     = null
}

variable "subnet_ids" {
  description = "The IDs of the subnets."
  type        = list(string)
  default     = []
}

variable "tags" {
  description = "Key-value mapping of resource tags."
  type        = map(string)
  default     = {}
}
