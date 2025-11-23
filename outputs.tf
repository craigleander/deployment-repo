################################################################################
# VPC
################################################################################

output "vpc_id" {
  description = "The ID of the VPC"
  value       = module.vpc.vpc_id
}

output "vpc_cidr_block" {
  description = "The CIDR block of the VPC"
  value       = module.vpc.vpc_cidr_block
}

output "public_subnets" {
  description = "List of IDs of public subnets"
  value       = module.vpc.public_subnets
}

output "private_subnets" {
  description = "List of IDs of private subnets"
  value       = module.vpc.private_subnets
}

################################################################################
# ALB
################################################################################

output "alb_id" {
  description = "The ID and ARN of the load balancer"
  value       = module.alb.id
}

output "alb_arn" {
  description = "The ARN of the load balancer"
  value       = module.alb.arn
}

output "alb_dns_name" {
  description = "The DNS name of the load balancer"
  value       = module.alb.dns_name
}

output "alb_zone_id" {
  description = "The zone_id of the load balancer"
  value       = module.alb.zone_id
}

output "alb_target_groups" {
  description = "Map of target groups created and their attributes"
  value       = module.alb.target_groups
}

output "alb_security_group_id" {
  description = "ID of the ALB security group"
  value       = module.alb.security_group_id
}

################################################################################
# ElastiCache
################################################################################

output "elasticache_cluster_arn" {
  description = "The ARN of the ElastiCache Cluster"
  value       = module.elasticache.cluster_arn
}

output "elasticache_replication_group_id" {
  description = "ID of the ElastiCache Replication Group"
  value       = module.elasticache.replication_group_id
}

output "elasticache_replication_group_primary_endpoint_address" {
  description = "Address of the endpoint for the primary node in the replication group"
  value       = module.elasticache.replication_group_primary_endpoint_address
}

output "elasticache_replication_group_reader_endpoint_address" {
  description = "Address of the endpoint for the reader node in the replication group"
  value       = module.elasticache.replication_group_reader_endpoint_address
}

output "elasticache_security_group_id" {
  description = "ID of the ElastiCache security group"
  value       = module.elasticache.security_group_id
}

################################################################################
# MSK
################################################################################

output "msk_arn" {
  description = "Amazon Resource Name (ARN) of the MSK cluster"
  value       = module.msk.arn
}

output "msk_bootstrap_brokers_tls" {
  description = "TLS connection host:port pairs"
  value       = module.msk.bootstrap_brokers_tls
}

output "msk_cluster_name" {
  description = "Name of the MSK cluster"
  value       = module.msk.cluster_name
}

output "msk_zookeeper_connect_string" {
  description = "Zookeeper connection string"
  value       = module.msk.zookeeper_connect_string
}

################################################################################
# Aurora
################################################################################

output "aurora_cluster_arn" {
  description = "Amazon Resource Name (ARN) of Aurora cluster"
  value       = module.aurora.cluster_arn
}

output "aurora_cluster_id" {
  description = "The RDS Cluster Identifier"
  value       = module.aurora.cluster_id
}

output "aurora_cluster_endpoint" {
  description = "Writer endpoint for the Aurora cluster"
  value       = module.aurora.cluster_endpoint
}

output "aurora_cluster_reader_endpoint" {
  description = "A read-only endpoint for the Aurora cluster"
  value       = module.aurora.cluster_reader_endpoint
}

output "aurora_cluster_database_name" {
  description = "Name for the automatically created database"
  value       = module.aurora.cluster_database_name
}

output "aurora_cluster_port" {
  description = "The database port"
  value       = module.aurora.cluster_port
}

################################################################################
# NLB
################################################################################

output "nlb_id" {
  description = "The ID and ARN of the NLB"
  value       = module.nlb.id
}

output "nlb_arn" {
  description = "The ARN of the NLB"
  value       = module.nlb.arn
}

output "nlb_dns_name" {
  description = "The DNS name of the NLB"
  value       = module.nlb.dns_name
}

output "nlb_zone_id" {
  description = "The zone_id of the NLB"
  value       = module.nlb.zone_id
}

output "nlb_target_groups" {
  description = "Map of NLB target groups created and their attributes"
  value       = module.nlb.target_groups
}

output "nlb_security_group_id" {
  description = "ID of the NLB security group"
  value       = module.nlb.security_group_id
}

################################################################################
# S3
################################################################################

output "s3_bucket_id" {
  description = "The name of the S3 bucket"
  value       = module.s3.s3_bucket_id
}

output "s3_bucket_arn" {
  description = "The ARN of the S3 bucket"
  value       = module.s3.s3_bucket_arn
}

output "s3_bucket_bucket_domain_name" {
  description = "The bucket domain name"
  value       = module.s3.s3_bucket_bucket_domain_name
}

output "s3_bucket_bucket_regional_domain_name" {
  description = "The bucket region-specific domain name"
  value       = module.s3.s3_bucket_bucket_regional_domain_name
}

output "s3_bucket_region" {
  description = "The AWS region this bucket resides in"
  value       = module.s3.s3_bucket_region
}
