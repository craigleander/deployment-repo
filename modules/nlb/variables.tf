variable "environment" {
  description = "Environment name"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

variable "subnets" {
  description = "List of subnet IDs"
  type        = list(string)
}

variable "enable_deletion_protection" {
  description = "Enable deletion protection for NLB"
  type        = bool
  default     = false
}

variable "enforce_sg_inbound_rules" {
  description = "Enforce security group inbound rules on private link traffic"
  type        = string
  default     = "off"
}

variable "security_group_ingress_rules" {
  description = "NLB Security group ingress rules"
  type        = any
  default     = {}
}

variable "security_group_egress_rules" {
  description = "NLB Security group egress rules"
  type        = any
  default     = {}
}

variable "listeners" {
  description = "NLB Listener configurations"
  type        = any
  default     = {}
}

variable "target_groups" {
  description = "NLB Target group configurations"
  type        = any
  default     = {}
}
