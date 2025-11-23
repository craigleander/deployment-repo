################################################################################
# Cluster
################################################################################

output "arn" {
  description = "Amazon Resource Name (ARN) of the MSK cluster"
  value       = module.msk_cluster.arn
}

output "bootstrap_brokers" {
  description = "Comma separated list of one or more hostname:port pairs of kafka brokers"
  value       = module.msk_cluster.bootstrap_brokers
}

output "bootstrap_brokers_tls" {
  description = "One or more DNS names (or IP addresses) and TLS port pairs"
  value       = module.msk_cluster.bootstrap_brokers_tls
}

output "cluster_name" {
  description = "Name of the MSK cluster"
  value       = module.msk_cluster.cluster_name
}

output "cluster_uuid" {
  description = "UUID of the MSK cluster"
  value       = module.msk_cluster.cluster_uuid
}

output "current_version" {
  description = "Current version of the MSK Cluster"
  value       = module.msk_cluster.current_version
}

output "zookeeper_connect_string" {
  description = "A comma separated list of one or more hostname:port pairs to connect to Apache Zookeeper"
  value       = module.msk_cluster.zookeeper_connect_string
}

################################################################################
# Configuration
################################################################################

output "configuration_arn" {
  description = "ARN of the MSK configuration"
  value       = module.msk_cluster.configuration_arn
}

output "configuration_latest_revision" {
  description = "Latest revision of the MSK configuration"
  value       = module.msk_cluster.configuration_latest_revision
}

################################################################################
# Security Group
################################################################################

output "security_group_id" {
  description = "ID of the security group"
  value       = try(module.msk_cluster.security_group_id, null)
}
