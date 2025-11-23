variable "environment" {
  description = "Environment name"
  type        = string
}

variable "name" {
  description = "Name of the EFS file system"
  type        = string
}

variable "creation_token" {
  description = "A unique name used as reference when creating the EFS"
  type        = string
  default     = null
}

variable "encrypted" {
  description = "If true, the file system will be encrypted"
  type        = bool
  default     = true
}

variable "kms_key_arn" {
  description = "ARN for the KMS encryption key"
  type        = string
  default     = null
}

variable "lifecycle_policy" {
  description = "A file system lifecycle policy object"
  type        = any
  default     = {}
}

variable "attach_policy" {
  description = "Determines whether a file system policy is attached"
  type        = bool
  default     = false
}

variable "bypass_policy_lockout_safety_check" {
  description = "A flag to indicate whether to bypass the file system policy lockout safety check"
  type        = bool
  default     = false
}

variable "policy_statements" {
  description = "A map of IAM policy statements"
  type        = any
  default     = {}
}

variable "mount_targets" {
  description = "A map of mount target definitions"
  type        = any
  default     = {}
}

variable "security_group_description" {
  description = "Description of the security group"
  type        = string
  default     = "EFS security group"
}

variable "security_group_vpc_id" {
  description = "VPC ID where the security group will be created"
  type        = string
}

variable "security_group_ingress_rules" {
  description = "Security group ingress rules"
  type        = any
  default     = {}
}

variable "access_points" {
  description = "A map of access point definitions"
  type        = any
  default     = {}
}

variable "enable_backup_policy" {
  description = "Determines whether a backup policy is enabled"
  type        = bool
  default     = true
}
