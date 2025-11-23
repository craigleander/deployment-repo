variable "environment" {
  description = "Environment name"
  type        = string
}

variable "cluster_id" {
  description = "Cluster ID"
  type        = string
}

variable "create_cluster" {
  description = "Whether to create cluster"
  type        = bool
  default     = true
}

variable "create_replication_group" {
  description = "Whether to create replication group"
  type        = bool
  default     = true
}

variable "replication_group_id" {
  description = "Replication group ID"
  type        = string
}

variable "engine_version" {
  description = "Redis engine version"
  type        = string
  default     = "7.1"
}

variable "node_type" {
  description = "Node type"
  type        = string
  default     = "cache.t4g.small"
}

variable "maintenance_window" {
  description = "Maintenance window"
  type        = string
  default     = "sun:05:00-sun:09:00"
}

variable "apply_immediately" {
  description = "Apply changes immediately"
  type        = bool
  default     = true
}

variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

variable "security_group_rules" {
  description = "Security group rules"
  type        = any
  default     = {}
}

variable "subnet_ids" {
  description = "List of subnet IDs"
  type        = list(string)
}

variable "subnet_group_name" {
  description = "Subnet group name"
  type        = string
}

variable "subnet_group_description" {
  description = "Subnet group description"
  type        = string
  default     = "ElastiCache subnet group"
}

variable "create_parameter_group" {
  description = "Whether to create parameter group"
  type        = bool
  default     = true
}

variable "parameter_group_name" {
  description = "Parameter group name"
  type        = string
}

variable "parameter_group_family" {
  description = "Parameter group family"
  type        = string
  default     = "redis7"
}

variable "parameter_group_description" {
  description = "Parameter group description"
  type        = string
  default     = "ElastiCache parameter group"
}

variable "parameters" {
  description = "List of parameters"
  type        = list(any)
  default     = []
}
