module "aurora" {
  source  = "terraform-aws-modules/rds-aurora/aws"
  version = "~> 9.0"

  name            = var.cluster_name
  engine          = var.engine
  engine_version  = var.engine_version
  master_username = var.master_username

  vpc_id               = var.vpc_id
  db_subnet_group_name = var.db_subnet_group_name

  manage_master_user_password = var.manage_master_user_password
  manage_master_user_password_rotation = var.manage_master_user_password_rotation
  master_user_password_rotation_automatically_after_days = var.master_user_password_rotation_automatically_after_days

  enabled_cloudwatch_logs_exports = var.enabled_cloudwatch_logs_exports

  cluster_performance_insights_enabled          = var.performance_insights_enabled
  cluster_performance_insights_retention_period = var.performance_insights_retention_period

  # Instance configuration
  instances = {
    one = {
      instance_class      = var.instance_class
      publicly_accessible = false
    }
  }

  skip_final_snapshot = var.skip_final_snapshot

  tags = {
    Environment = var.environment
    Terraform   = "true"
  }
}
