module "elasticache" {
  source  = "terraform-aws-modules/elasticache/aws"
  version = "~> 1.0"

  cluster_id               = var.cluster_id
  create_cluster           = var.create_cluster
  create_replication_group = var.create_replication_group
  replication_group_id     = var.replication_group_id

  engine_version = var.engine_version
  node_type      = var.node_type

  maintenance_window = var.maintenance_window
  apply_immediately  = var.apply_immediately

  # Security Group
  vpc_id = var.vpc_id
  security_group_rules = var.security_group_rules

  # Subnet Group
  subnet_group_name        = var.subnet_group_name
  subnet_group_description = var.subnet_group_description
  subnet_ids               = var.subnet_ids

  # Parameter Group
  create_parameter_group      = var.create_parameter_group
  parameter_group_name        = var.parameter_group_name
  parameter_group_family      = var.parameter_group_family
  parameter_group_description = var.parameter_group_description
  parameters                  = var.parameters

  tags = {
    Environment = var.environment
    Terraform   = "true"
  }
}
