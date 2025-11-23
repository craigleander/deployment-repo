variable "environment" {
  description = "Environment name"
  type        = string
}

variable "role_name" {
  description = "Name of the IAM role"
  type        = string
}

variable "create_instance_profile" {
  description = "Whether to create an instance profile"
  type        = bool
  default     = false
}

variable "trust_policy_permissions" {
  description = "Map of trust policy permissions"
  type        = any
  default     = {}
}

variable "policies" {
  description = "Map of IAM policies to attach to the role"
  type        = map(string)
  default     = {}
}

variable "enable_github_oidc" {
  description = "Enable GitHub OIDC provider"
  type        = bool
  default     = false
}

variable "oidc_subjects" {
  description = "List of OIDC subjects for GitHub Actions"
  type        = list(string)
  default     = []
}

variable "enable_oidc" {
  description = "Enable generic OIDC provider"
  type        = bool
  default     = false
}

variable "oidc_provider_urls" {
  description = "List of OIDC provider URLs"
  type        = list(string)
  default     = []
}

variable "oidc_audiences" {
  description = "List of OIDC audiences"
  type        = list(string)
  default     = []
}

variable "enable_saml" {
  description = "Enable SAML 2.0 federation"
  type        = bool
  default     = false
}

variable "saml_provider_ids" {
  description = "List of SAML provider IDs"
  type        = list(string)
  default     = []
}
