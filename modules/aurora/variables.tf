variable "environment" {
  description = "Environment name"
  type        = string
}

variable "cluster_name" {
  description = "Aurora cluster name"
  type        = string
}

variable "engine" {
  description = "Aurora database engine"
  type        = string
  default     = "aurora-postgresql"
}

variable "engine_version" {
  description = "Aurora engine version"
  type        = string
  default     = "17.5"
}

variable "master_username" {
  description = "Master username"
  type        = string
  default     = "root"
}

variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

variable "db_subnet_group_name" {
  description = "Database subnet group name"
  type        = string
}

variable "manage_master_user_password" {
  description = "Whether to manage master user password with Secrets Manager"
  type        = bool
  default     = true
}

variable "manage_master_user_password_rotation" {
  description = "Whether to manage master user password rotation"
  type        = bool
  default     = false
}

variable "master_user_password_rotation_automatically_after_days" {
  description = "Number of days after which to rotate password automatically"
  type        = number
  default     = 30
}

variable "enabled_cloudwatch_logs_exports" {
  description = "List of log types to export to CloudWatch"
  type        = list(string)
  default     = []
}

variable "performance_insights_enabled" {
  description = "Enable Performance Insights"
  type        = bool
  default     = true
}

variable "performance_insights_retention_period" {
  description = "Performance Insights retention period in days"
  type        = number
  default     = 7
}

variable "instance_class" {
  description = "Instance class for Aurora instances"
  type        = string
  default     = "db.r6g.large"
}

variable "skip_final_snapshot" {
  description = "Skip final snapshot"
  type        = bool
  default     = true
}
