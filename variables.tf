variable "region" {
  description = "Region where resources will be created."
  type        = string
  default     = null
}

#Trust Provider Settings
variable "trust_provider_type" {
  description = "The type of trust provider can be either user or device-based."
  type        = string
}

variable "policy_reference_name" {
  description = "The type of trust provider can be either user or device-based."
  type        = string
}

variable "user_trust_provider_type" {
  description = "The type of user-based trust provider."
  type        = string
  default     = "iam-identity-center"
}

#OIDC Settings
variable "authorization_endpoint" {
  description = "The OIDC authorization endpoint."
  type        = string
  default     = null
}

variable "client_id" {
  description = "The client identifier."
  type        = string
  default     = null
}

variable "client_secret" {
  description = "The client secret."
  type        = string
  default     = null
}

variable "issuer" {
  description = "The OIDC issuer."
  type        = string
  default     = null
}

variable "scope" {
  description = "OpenID Connect (OIDC) scopes are used by an application during authentication to authorize access to details of a user."
  type        = string
  default     = null
}

variable "token_endpoint" {
  description = "The OIDC token endpoint."
  type        = string
  default     = null
}

variable "user_info_endpoint" {
  description = "The OIDC user info endpoint."
  type        = string
  default     = null
}

#Access Group Settings
variable "group_policy_document" {
  description = "he policy document that is associated with this resource."
  type        = string
  default     = null
}

variable "tags" {
  description = "Key-value mapping of resource tags."
  type        = map(string)
  default     = {}
}
