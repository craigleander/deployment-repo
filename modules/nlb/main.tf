module "nlb" {
  source  = "terraform-aws-modules/alb/aws"
  version = "~> 9.0"

  name = "${var.environment}-nlb"

  load_balancer_type = "network"
  vpc_id             = var.vpc_id
  subnets            = var.subnets

  # For example only
  enable_deletion_protection = var.enable_deletion_protection

  # Security Group
  enforce_security_group_inbound_rules_on_private_link_traffic = var.enforce_sg_inbound_rules
  security_group_ingress_rules                                 = var.security_group_ingress_rules
  security_group_egress_rules                                  = var.security_group_egress_rules

  listeners = var.listeners

  target_groups = var.target_groups

  tags = {
    Environment = var.environment
    Terraform   = "true"
  }
}
