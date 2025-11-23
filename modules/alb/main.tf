module "alb" {
  source  = "terraform-aws-modules/alb/aws"
  version = "~> 9.0"

  name    = "${var.environment}-alb"
  vpc_id  = var.vpc_id
  subnets = var.public_subnets

  # For example only
  enable_deletion_protection = var.enable_deletion_protection

  # Security Group
  security_group_ingress_rules = var.security_group_ingress_rules
  security_group_egress_rules  = var.security_group_egress_rules

  listeners = var.listeners

  target_groups = var.target_groups

  tags = {
    Environment = var.environment
    Terraform   = "true"
  }
}
