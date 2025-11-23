module "efs" {
  source  = "terraform-aws-modules/efs/aws"
  version = "~> 1.0"

  # File system
  name           = var.name
  creation_token = var.creation_token
  encrypted      = var.encrypted
  kms_key_arn    = var.kms_key_arn

  lifecycle_policy = var.lifecycle_policy

  # File system policy
  attach_policy                      = var.attach_policy
  bypass_policy_lockout_safety_check = var.bypass_policy_lockout_safety_check
  policy_statements                  = var.policy_statements

  # Mount targets / security group
  mount_targets                = var.mount_targets
  security_group_description   = var.security_group_description
  security_group_vpc_id        = var.security_group_vpc_id
  security_group_ingress_rules = var.security_group_ingress_rules

  # Access point(s)
  access_points = var.access_points

  # Backup policy
  enable_backup_policy = var.enable_backup_policy

  tags = {
    Environment = var.environment
    Terraform   = "true"
  }
}
