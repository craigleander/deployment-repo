################################################################################
# File System
################################################################################

output "arn" {
  description = "Amazon Resource Name of the file system"
  value       = module.efs.arn
}

output "id" {
  description = "The ID that identifies the file system"
  value       = module.efs.id
}

output "dns_name" {
  description = "The DNS name for the filesystem"
  value       = module.efs.dns_name
}

output "size_in_bytes" {
  description = "The latest known metered size (in bytes) of data stored in the file system"
  value       = module.efs.size_in_bytes
}

################################################################################
# Mount Target(s)
################################################################################

output "mount_targets" {
  description = "Map of mount targets created and their attributes"
  value       = module.efs.mount_targets
}

################################################################################
# Security Group
################################################################################

output "security_group_arn" {
  description = "ARN of the security group"
  value       = module.efs.security_group_arn
}

output "security_group_id" {
  description = "ID of the security group"
  value       = module.efs.security_group_id
}

################################################################################
# Access Point(s)
################################################################################

output "access_points" {
  description = "Map of access points created and their attributes"
  value       = module.efs.access_points
}
