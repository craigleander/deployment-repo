variable "environment" {
  description = "Environment name"
  type        = string
}

variable "cluster_name" {
  description = "MSK cluster name"
  type        = string
}

variable "kafka_version" {
  description = "Kafka version"
  type        = string
  default     = "3.5.1"
}

variable "number_of_broker_nodes" {
  description = "Number of broker nodes"
  type        = number
  default     = 3
}

variable "enhanced_monitoring" {
  description = "Enhanced monitoring level"
  type        = string
  default     = "PER_TOPIC_PER_PARTITION"
}

variable "broker_node_client_subnets" {
  description = "List of subnet IDs for broker nodes"
  type        = list(string)
}

variable "broker_node_instance_type" {
  description = "Instance type for broker nodes"
  type        = string
  default     = "kafka.m5.large"
}

variable "broker_node_security_groups" {
  description = "List of security group IDs for broker nodes"
  type        = list(string)
}

variable "broker_node_ebs_volume_size" {
  description = "EBS volume size for broker nodes"
  type        = number
  default     = 100
}

variable "encryption_in_transit_client_broker" {
  description = "Encryption in transit between clients and brokers"
  type        = string
  default     = "TLS"
}

variable "encryption_in_transit_in_cluster" {
  description = "Encryption in transit within the cluster"
  type        = bool
  default     = true
}

variable "configuration_name" {
  description = "Configuration name"
  type        = string
  default     = ""
}

variable "configuration_description" {
  description = "Configuration description"
  type        = string
  default     = ""
}

variable "configuration_server_properties" {
  description = "Server properties for configuration"
  type        = map(string)
  default     = {}
}

variable "jmx_exporter_enabled" {
  description = "Enable JMX exporter"
  type        = bool
  default     = true
}

variable "node_exporter_enabled" {
  description = "Enable node exporter"
  type        = bool
  default     = true
}

variable "cloudwatch_logs_enabled" {
  description = "Enable CloudWatch logs"
  type        = bool
  default     = true
}

variable "client_authentication" {
  description = "Client authentication configuration"
  type        = any
  default     = {}
}
