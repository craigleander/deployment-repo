# Development Environment Configuration

# Core Variables
region      = "us-east-1"
environment = "dev"
vpc_cidr    = "10.0.0.0/16"

# ALB Variables
alb_enable_deletion_protection = false
alb_security_group_ingress_rules = {
  all_http = {
    from_port   = 80
    to_port     = 80
    ip_protocol = "tcp"
    description = "HTTP web traffic"
    cidr_ipv4   = "0.0.0.0/0"
  }
  all_https = {
    from_port   = 443
    to_port     = 443
    ip_protocol = "tcp"
    description = "HTTPS web traffic"
    cidr_ipv4   = "0.0.0.0/0"
  }
}
alb_security_group_egress_rules = {
  all = {
    ip_protocol = "-1"
    cidr_ipv4   = "0.0.0.0/0"
  }
}
alb_listeners = {
  ex-http = {
    port     = 80
    protocol = "HTTP"
    forward = {
      target_group_key = "ex-instance"
    }
  }
}
alb_target_groups = {
  ex-instance = {
    name_prefix          = "h1-"
    protocol             = "HTTP"
    port                 = 80
    target_type          = "instance"
    deregistration_delay = 10
    create_attachment    = false
    health_check = {
      enabled             = true
      interval            = 30
      path                = "/"
      port                = "traffic-port"
      healthy_threshold   = 3
      unhealthy_threshold = 3
      timeout             = 6
      protocol            = "HTTP"
      matcher             = "200-399"
    }
    protocol_version = "HTTP1"
    tags = {
      InstanceTargetGroupTag = "baz"
    }
  }
}

# ElastiCache Variables
elasticache_cluster_id                  = "dev-redis"
elasticache_create_cluster              = true
elasticache_create_replication_group    = true
elasticache_replication_group_id        = "dev-redis-repl-grp"
elasticache_engine_version              = "7.1"
elasticache_node_type                   = "cache.t4g.small"
elasticache_maintenance_window          = "sun:05:00-sun:09:00"
elasticache_apply_immediately           = true
elasticache_security_group_rules        = {}
elasticache_subnet_group_name           = "dev-elasticache"
elasticache_subnet_group_description    = "ElastiCache subnet group"
elasticache_create_parameter_group      = true
elasticache_parameter_group_name        = "dev-redis"
elasticache_parameter_group_family      = "redis7"
elasticache_parameter_group_description = "ElastiCache parameter group"
elasticache_parameters = [
  {
    name  = "latency-tracking"
    value = "yes"
  }
]

# MSK Variables
msk_cluster_name                        = "dev-msk-cluster"
msk_kafka_version                       = "3.5.1"
msk_number_of_broker_nodes              = 3
msk_enhanced_monitoring                 = "PER_TOPIC_PER_PARTITION"
msk_broker_node_instance_type           = "kafka.m5.large"
msk_broker_node_ebs_volume_size         = 100
msk_encryption_in_transit_client_broker = "TLS"
msk_encryption_in_transit_in_cluster    = true
msk_configuration_name                  = "dev-msk-configuration"
msk_configuration_description           = "MSK cluster configuration"
msk_configuration_server_properties = {
  "auto.create.topics.enable" = "true"
  "delete.topic.enable"       = "true"
}
msk_jmx_exporter_enabled    = true
msk_node_exporter_enabled   = true
msk_cloudwatch_logs_enabled = true
msk_client_authentication   = {}

# Aurora Variables
aurora_cluster_name                                           = "dev-aurora-cluster"
aurora_engine                                                 = "aurora-postgresql"
aurora_engine_version                                         = "17.5"
aurora_master_username                                        = "root"
aurora_manage_master_user_password                            = true
aurora_manage_master_user_password_rotation                   = false
aurora_master_user_password_rotation_automatically_after_days = 30
aurora_enabled_cloudwatch_logs_exports                        = ["postgresql"]
aurora_performance_insights_enabled                           = true
aurora_performance_insights_retention_period                  = 7
aurora_instance_class                                         = "db.r6g.large"
aurora_skip_final_snapshot                                    = true

# NLB Variables
nlb_enable_deletion_protection = false
nlb_enforce_sg_inbound_rules   = "off"
nlb_security_group_ingress_rules = {
  all_tcp = {
    from_port   = 80
    to_port     = 84
    ip_protocol = "tcp"
    description = "TCP traffic"
    cidr_ipv4   = "0.0.0.0/0"
  }
}
nlb_security_group_egress_rules = {
  all = {
    ip_protocol = "-1"
    cidr_ipv4   = "10.0.0.0/16"
  }
}
nlb_listeners = {
  ex-tcp = {
    port     = 80
    protocol = "TCP"
    forward = {
      target_group_key = "ex-instance"
    }
  }
}
nlb_target_groups = {
  ex-instance = {
    name_prefix          = "n1-"
    protocol             = "TCP"
    port                 = 80
    target_type          = "instance"
    deregistration_delay = 10
    create_attachment    = false
    health_check = {
      enabled             = true
      interval            = 30
      port                = "traffic-port"
      healthy_threshold   = 3
      unhealthy_threshold = 3
      timeout             = 10
      protocol            = "TCP"
    }
  }
}

# S3 Variables
s3_bucket_name           = "dev-s3-bucket-20260110"
s3_acl                   = "private"
s3_control_object_ownership = true
s3_object_ownership      = "BucketOwnerPreferred"
s3_versioning = {
  enabled = true
}
s3_server_side_encryption_configuration = {
  rule = {
    apply_server_side_encryption_by_default = {
      sse_algorithm = "AES256"
    }
  }
}
s3_lifecycle_rule           = []
s3_block_public_acls        = true
s3_block_public_policy      = true
s3_ignore_public_acls       = true
s3_restrict_public_buckets  = true
