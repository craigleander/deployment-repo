################################################################################
# IAM Role
################################################################################

output "arn" {
  description = "ARN of IAM role"
  value       = module.iam_role.arn
}

output "name" {
  description = "Name of IAM role"
  value       = module.iam_role.name
}

output "path" {
  description = "Path of IAM role"
  value       = module.iam_role.path
}

output "unique_id" {
  description = "Unique ID of IAM role"
  value       = module.iam_role.unique_id
}

################################################################################
# IAM Instance Profile
################################################################################

output "instance_profile_arn" {
  description = "ARN of IAM instance profile"
  value       = try(module.iam_role.instance_profile_arn, null)
}

output "instance_profile_name" {
  description = "Name of IAM instance profile"
  value       = try(module.iam_role.instance_profile_name, null)
}
