variable "environment" {
  description = "Environment name"
  type        = string
}

variable "api_name" {
  description = "Name of the API Gateway"
  type        = string
}

variable "description" {
  description = "Description of the API Gateway"
  type        = string
  default     = ""
}

variable "protocol_type" {
  description = "API protocol type. Valid values: HTTP, WEBSOCKET"
  type        = string
  default     = "HTTP"
}

variable "cors_configuration" {
  description = "CORS configuration for the API"
  type        = any
  default     = {}
}

variable "create_domain_name" {
  description = "Whether to create a domain name for the API"
  type        = bool
  default     = false
}

variable "domain_name" {
  description = "Domain name for the API"
  type        = string
  default     = null
}

variable "domain_name_certificate_arn" {
  description = "ARN of the AWS-managed certificate for the domain name"
  type        = string
  default     = null
}

variable "routes" {
  description = "Map of API Gateway routes and integrations"
  type        = any
  default     = {}
}

variable "vpc_links" {
  description = "Map of VPC Link definitions"
  type        = any
  default     = {}
}

variable "stage_name" {
  description = "Name of the API stage"
  type        = string
  default     = "$default"
}

variable "stage_description" {
  description = "Description of the API stage"
  type        = string
  default     = null
}

variable "stage_variables" {
  description = "Map of stage variables"
  type        = map(string)
  default     = {}
}

variable "stage_access_log_settings" {
  description = "Settings for access logging"
  type        = any
  default     = {}
}
