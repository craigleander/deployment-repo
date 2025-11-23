variable "environment" {
  description = "Environment name"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

variable "public_subnets" {
  description = "List of public subnet IDs"
  type        = list(string)
}

variable "enable_deletion_protection" {
  description = "Enable deletion protection for ALB"
  type        = bool
  default     = false
}

variable "security_group_ingress_rules" {
  description = "Security group ingress rules"
  type        = any
  default     = {}
}

variable "security_group_egress_rules" {
  description = "Security group egress rules"
  type        = any
  default     = {}
}

variable "listeners" {
  description = "Map of listener configurations"
  type        = any
  default     = {}
}

variable "target_groups" {
  description = "Map of target group configurations"
  type        = any
  default     = {}
}
