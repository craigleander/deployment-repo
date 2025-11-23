################################################################################
# Cluster
################################################################################

output "cluster_arn" {
  description = "The ARN of the ElastiCache Cluster"
  value       = module.elasticache.cluster_arn
}

output "cluster_engine_version_actual" {
  description = "Because ElastiCache pulls the latest minor or patch for a version, this attribute returns the running version of the cache engine"
  value       = module.elasticache.cluster_engine_version_actual
}

output "cluster_cache_nodes" {
  description = "List of node objects including id, address, port and availability_zone"
  value       = module.elasticache.cluster_cache_nodes
}

################################################################################
# Replication Group
################################################################################

output "replication_group_arn" {
  description = "ARN of the created ElastiCache Replication Group"
  value       = module.elasticache.replication_group_arn
}

output "replication_group_id" {
  description = "ID of the ElastiCache Replication Group"
  value       = module.elasticache.replication_group_id
}

output "replication_group_primary_endpoint_address" {
  description = "Address of the endpoint for the primary node in the replication group"
  value       = module.elasticache.replication_group_primary_endpoint_address
}

output "replication_group_reader_endpoint_address" {
  description = "Address of the endpoint for the reader node in the replication group"
  value       = module.elasticache.replication_group_reader_endpoint_address
}

################################################################################
# Security Group
################################################################################

output "security_group_id" {
  description = "ID of the security group"
  value       = module.elasticache.security_group_id
}
