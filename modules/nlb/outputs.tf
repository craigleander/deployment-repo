################################################################################
# Load Balancer
################################################################################

output "id" {
  description = "The ID and ARN of the load balancer"
  value       = module.nlb.id
}

output "arn" {
  description = "The ARN of the load balancer"
  value       = module.nlb.arn
}

output "arn_suffix" {
  description = "ARN suffix of the load balancer"
  value       = module.nlb.arn_suffix
}

output "dns_name" {
  description = "The DNS name of the load balancer"
  value       = module.nlb.dns_name
}

output "zone_id" {
  description = "The zone_id of the load balancer"
  value       = module.nlb.zone_id
}

################################################################################
# Listener(s)
################################################################################

output "listeners" {
  description = "Map of listeners created and their attributes"
  value       = module.nlb.listeners
}

################################################################################
# Target Group(s)
################################################################################

output "target_groups" {
  description = "Map of target groups created and their attributes"
  value       = module.nlb.target_groups
}

################################################################################
# Security Group
################################################################################

output "security_group_id" {
  description = "ID of the security group"
  value       = module.nlb.security_group_id
}
