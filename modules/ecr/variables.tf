variable "environment" {
  description = "Environment name"
  type        = string
}

variable "repository_name" {
  description = "Name of the repository"
  type        = string
}

variable "repository_type" {
  description = "The type of repository to create. Either `private` or `public`"
  type        = string
  default     = "private"
}

variable "repository_read_write_access_arns" {
  description = "The ARNs of the IAM users/roles that have read/write access to the repository"
  type        = list(string)
  default     = []
}

variable "repository_read_access_arns" {
  description = "The ARNs of the IAM users/roles that have read-only access to the repository"
  type        = list(string)
  default     = []
}

variable "create_lifecycle_policy" {
  description = "Determines whether a lifecycle policy will be created"
  type        = bool
  default     = true
}

variable "repository_lifecycle_policy" {
  description = "The policy document. This is a JSON formatted string"
  type        = string
  default     = ""
}

variable "repository_force_delete" {
  description = "If `true`, will delete the repository even if it contains images"
  type        = bool
  default     = false
}

variable "repository_image_tag_mutability" {
  description = "The tag mutability setting for the repository. Must be one of: `MUTABLE` or `IMMUTABLE`"
  type        = string
  default     = "MUTABLE"
}

variable "repository_encryption_type" {
  description = "The encryption type for the repository. Must be one of: `AES256` or `KMS`"
  type        = string
  default     = "AES256"
}

variable "repository_kms_key" {
  description = "The ARN of the KMS key to use when encryption_type is `KMS`"
  type        = string
  default     = null
}

variable "repository_image_scan_on_push" {
  description = "Indicates whether images are scanned after being pushed to the repository"
  type        = bool
  default     = true
}

variable "public_repository_catalog_data" {
  description = "Catalog data configuration for the repository"
  type        = any
  default     = {}
}
