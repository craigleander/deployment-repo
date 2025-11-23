module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "~> 5.0"

  name = "${var.environment}-vpc"
  cidr = var.vpc_cidr

  azs             = ["${var.region}a", "${var.region}b", "${var.region}c"]
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  public_subnets  = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]
  database_subnets = ["10.0.201.0/24", "10.0.202.0/24", "10.0.203.0/24"]

  create_database_subnet_group = true
  database_subnet_group_name   = "${var.environment}-db-subnet-group"

  enable_nat_gateway = true
  single_nat_gateway = true
  enable_vpn_gateway = false

  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Terraform   = "true"
    Environment = var.environment
  }
}

module "alb" {
  source = "./modules/alb"

  environment               = var.environment
  vpc_id                    = module.vpc.vpc_id
  public_subnets            = module.vpc.public_subnets
  enable_deletion_protection = var.alb_enable_deletion_protection
  security_group_ingress_rules = var.alb_security_group_ingress_rules
  security_group_egress_rules  = var.alb_security_group_egress_rules
  listeners                 = var.alb_listeners
  target_groups             = var.alb_target_groups
}

module "elasticache" {
  source = "./modules/elasticache"

  environment                     = var.environment
  cluster_id                      = var.elasticache_cluster_id
  create_cluster                  = var.elasticache_create_cluster
  create_replication_group        = var.elasticache_create_replication_group
  replication_group_id            = var.elasticache_replication_group_id
  engine_version                  = var.elasticache_engine_version
  node_type                       = var.elasticache_node_type
  maintenance_window              = var.elasticache_maintenance_window
  apply_immediately               = var.elasticache_apply_immediately
  vpc_id                          = module.vpc.vpc_id
  security_group_rules            = var.elasticache_security_group_rules
  subnet_ids                      = module.vpc.private_subnets
  subnet_group_name               = var.elasticache_subnet_group_name
  subnet_group_description        = var.elasticache_subnet_group_description
  create_parameter_group          = var.elasticache_create_parameter_group
  parameter_group_name            = var.elasticache_parameter_group_name
  parameter_group_family          = var.elasticache_parameter_group_family
  parameter_group_description     = var.elasticache_parameter_group_description
  parameters                      = var.elasticache_parameters
}

module "msk" {
  source = "./modules/msk"

  environment                         = var.environment
  cluster_name                        = var.msk_cluster_name
  kafka_version                       = var.msk_kafka_version
  number_of_broker_nodes              = var.msk_number_of_broker_nodes
  enhanced_monitoring                 = var.msk_enhanced_monitoring
  broker_node_client_subnets          = module.vpc.private_subnets
  broker_node_instance_type           = var.msk_broker_node_instance_type
  broker_node_security_groups         = [module.vpc.default_security_group_id]
  broker_node_ebs_volume_size         = var.msk_broker_node_ebs_volume_size
  encryption_in_transit_client_broker = var.msk_encryption_in_transit_client_broker
  encryption_in_transit_in_cluster    = var.msk_encryption_in_transit_in_cluster
  configuration_name                  = var.msk_configuration_name
  configuration_description           = var.msk_configuration_description
  configuration_server_properties     = var.msk_configuration_server_properties
  jmx_exporter_enabled                = var.msk_jmx_exporter_enabled
  node_exporter_enabled               = var.msk_node_exporter_enabled
  cloudwatch_logs_enabled             = var.msk_cloudwatch_logs_enabled
  client_authentication               = var.msk_client_authentication
}

module "aurora" {
  source = "./modules/aurora"

  environment                                            = var.environment
  cluster_name                                           = var.aurora_cluster_name
  engine                                                 = var.aurora_engine
  engine_version                                         = var.aurora_engine_version
  master_username                                        = var.aurora_master_username
  vpc_id                                                 = module.vpc.vpc_id
  db_subnet_group_name                                   = module.vpc.database_subnet_group_name
  manage_master_user_password                            = var.aurora_manage_master_user_password
  manage_master_user_password_rotation                   = var.aurora_manage_master_user_password_rotation
  master_user_password_rotation_automatically_after_days = var.aurora_master_user_password_rotation_automatically_after_days
  enabled_cloudwatch_logs_exports                        = var.aurora_enabled_cloudwatch_logs_exports
  performance_insights_enabled                           = var.aurora_performance_insights_enabled
  performance_insights_retention_period                  = var.aurora_performance_insights_retention_period
  instance_class                                         = var.aurora_instance_class
  skip_final_snapshot                                    = var.aurora_skip_final_snapshot
}

module "nlb" {
  source = "./modules/nlb"

  environment                     = var.environment
  vpc_id                          = module.vpc.vpc_id
  subnets                         = module.vpc.public_subnets
  enable_deletion_protection      = var.nlb_enable_deletion_protection
  enforce_sg_inbound_rules        = var.nlb_enforce_sg_inbound_rules
  security_group_ingress_rules    = var.nlb_security_group_ingress_rules
  security_group_egress_rules     = var.nlb_security_group_egress_rules
  listeners                       = var.nlb_listeners
  target_groups                   = var.nlb_target_groups
}

module "s3" {
  source = "./modules/s3"

  environment                          = var.environment
  bucket_name                          = var.s3_bucket_name
  acl                                  = var.s3_acl
  control_object_ownership             = var.s3_control_object_ownership
  object_ownership                     = var.s3_object_ownership
  versioning                           = var.s3_versioning
  server_side_encryption_configuration = var.s3_server_side_encryption_configuration
  lifecycle_rule                       = var.s3_lifecycle_rule
  block_public_acls                    = var.s3_block_public_acls
  block_public_policy                  = var.s3_block_public_policy
  ignore_public_acls                   = var.s3_ignore_public_acls
  restrict_public_buckets              = var.s3_restrict_public_buckets
}
