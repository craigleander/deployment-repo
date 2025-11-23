variable "environment" {
  description = "Environment name"
  type        = string
}

variable "bucket_name" {
  description = "Name of the S3 bucket"
  type        = string
}

variable "acl" {
  description = "ACL for the bucket"
  type        = string
  default     = "private"
}

variable "control_object_ownership" {
  description = "Whether to manage S3 Bucket Ownership Controls"
  type        = bool
  default     = true
}

variable "object_ownership" {
  description = "Object ownership"
  type        = string
  default     = "BucketOwnerPreferred"
}

variable "versioning" {
  description = "Versioning configuration"
  type        = any
  default     = {
    enabled = true
  }
}

variable "server_side_encryption_configuration" {
  description = "Server-side encryption configuration"
  type        = any
  default     = {
    rule = {
      apply_server_side_encryption_by_default = {
        sse_algorithm = "AES256"
      }
    }
  }
}

variable "lifecycle_rule" {
  description = "Lifecycle rules"
  type        = any
  default     = []
}

variable "block_public_acls" {
  description = "Block public ACLs"
  type        = bool
  default     = true
}

variable "block_public_policy" {
  description = "Block public policy"
  type        = bool
  default     = true
}

variable "ignore_public_acls" {
  description = "Ignore public ACLs"
  type        = bool
  default     = true
}

variable "restrict_public_buckets" {
  description = "Restrict public buckets"
  type        = bool
  default     = true
}
