################################################################################
# EC2 Instance
################################################################################

output "id" {
  description = "The ID of the instance"
  value       = module.ec2_instance.id
}

output "arn" {
  description = "The ARN of the instance"
  value       = module.ec2_instance.arn
}

output "instance_state" {
  description = "The state of the instance"
  value       = module.ec2_instance.instance_state
}

output "primary_network_interface_id" {
  description = "The ID of the instance's primary network interface"
  value       = module.ec2_instance.primary_network_interface_id
}

output "private_dns" {
  description = "The private DNS name assigned to the instance"
  value       = module.ec2_instance.private_dns_name_override
}

output "public_dns" {
  description = "The public DNS name assigned to the instance"
  value       = module.ec2_instance.public_dns
}

output "public_ip" {
  description = "The public IP address assigned to the instance"
  value       = module.ec2_instance.public_ip
}

output "private_ip" {
  description = "The private IP address assigned to the instance"
  value       = module.ec2_instance.private_ip
}

################################################################################
# IAM Role / Instance Profile
################################################################################

output "iam_role_name" {
  description = "The name of the IAM role"
  value       = try(module.ec2_instance.iam_role_name, null)
}

output "iam_role_arn" {
  description = "The ARN of the IAM role"
  value       = try(module.ec2_instance.iam_role_arn, null)
}

output "iam_instance_profile_arn" {
  description = "ARN assigned by AWS to the instance profile"
  value       = try(module.ec2_instance.iam_instance_profile_arn, null)
}
