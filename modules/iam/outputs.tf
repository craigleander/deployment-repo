################################################################################
# IAM Role
################################################################################

output "arn" {
  description = "ARN of IAM role"
  value       = module.iam_role_for_service_accounts.arn
}

output "name" {
  description = "Name of IAM role"
  value       = module.iam_role_for_service_accounts.name
}

output "path" {
  description = "Path of IAM role"
  value       = module.iam_role_for_service_accounts.path
}

output "unique_id" {
  description = "Unique ID of IAM role"
  value       = module.iam_role_for_service_accounts.unique_id
}

################################################################################
# IAM Policy
################################################################################

output "iam_policy_arn" {
  description = "The ARN assigned by AWS to this policy"
  value       = try(module.iam_role_for_service_accounts.iam_policy_arn, null)
}

output "iam_policy" {
  description = "The policy document"
  value       = try(module.iam_role_for_service_accounts.iam_policy, null)
}
