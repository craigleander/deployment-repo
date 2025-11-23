variable "region" {
  description = "AWS Region"
  type        = string
  default     = "us-east-1"
}

variable "environment" {
  description = "Environment name"
  type        = string
  default     = "dev"
}

variable "vpc_cidr" {
  description = "CIDR block for VPC"
  type        = string
  default     = "10.0.0.0/16"
}

# ALB Variables
variable "alb_enable_deletion_protection" {
  description = "Enable deletion protection for ALB"
  type        = bool
  default     = false
}

variable "alb_security_group_ingress_rules" {
  description = "ALB Security group ingress rules"
  type        = any
  default     = {
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
}

variable "alb_security_group_egress_rules" {
  description = "ALB Security group egress rules"
  type        = any
  default     = {
    all = {
      ip_protocol = "-1"
      cidr_ipv4   = "0.0.0.0/0"
    }
  }
}

variable "alb_listeners" {
  description = "ALB Listener configurations"
  type        = any
  default     = {
    ex-http = {
      port     = 80
      protocol = "HTTP"
      forward = {
        target_group_key = "ex-instance"
      }
    }
  }
}

variable "alb_target_groups" {
  description = "ALB Target group configurations"
  type        = any
  default     = {
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
}

# ElastiCache Variables
variable "elasticache_cluster_id" {
  description = "ElastiCache cluster ID"
  type        = string
  default     = "dev-redis"
}

variable "elasticache_create_cluster" {
  description = "Whether to create cluster"
  type        = bool
  default     = true
}

variable "elasticache_create_replication_group" {
  description = "Whether to create replication group"
  type        = bool
  default     = true
}

variable "elasticache_replication_group_id" {
  description = "Replication group ID"
  type        = string
  default     = "dev-redis-repl-grp"
}

variable "elasticache_engine_version" {
  description = "Redis engine version"
  type        = string
  default     = "7.1"
}

variable "elasticache_node_type" {
  description = "Node type"
  type        = string
  default     = "cache.t4g.small"
}

variable "elasticache_maintenance_window" {
  description = "Maintenance window"
  type        = string
  default     = "sun:05:00-sun:09:00"
}

variable "elasticache_apply_immediately" {
  description = "Apply changes immediately"
  type        = bool
  default     = true
}

variable "elasticache_security_group_rules" {
  description = "ElastiCache security group rules"
  type        = any
  default     = {}
}

variable "elasticache_subnet_group_name" {
  description = "Subnet group name"
  type        = string
  default     = "dev-elasticache"
}

variable "elasticache_subnet_group_description" {
  description = "Subnet group description"
  type        = string
  default     = "ElastiCache subnet group"
}

variable "elasticache_create_parameter_group" {
  description = "Whether to create parameter group"
  type        = bool
  default     = true
}

variable "elasticache_parameter_group_name" {
  description = "Parameter group name"
  type        = string
  default     = "dev-redis"
}

variable "elasticache_parameter_group_family" {
  description = "Parameter group family"
  type        = string
  default     = "redis7"
}

variable "elasticache_parameter_group_description" {
  description = "Parameter group description"
  type        = string
  default     = "ElastiCache parameter group"
}

variable "elasticache_parameters" {
  description = "List of parameters"
  type        = list(any)
  default     = [
    {
      name  = "latency-tracking"
      value = "yes"
    }
  ]
}

# MSK Variables
variable "msk_cluster_name" {
  description = "MSK cluster name"
  type        = string
  default     = "dev-msk-cluster"
}

variable "msk_kafka_version" {
  description = "Kafka version"
  type        = string
  default     = "3.5.1"
}

variable "msk_number_of_broker_nodes" {
  description = "Number of broker nodes"
  type        = number
  default     = 3
}

variable "msk_enhanced_monitoring" {
  description = "Enhanced monitoring level"
  type        = string
  default     = "PER_TOPIC_PER_PARTITION"
}

variable "msk_broker_node_instance_type" {
  description = "Instance type for broker nodes"
  type        = string
  default     = "kafka.m5.large"
}

variable "msk_broker_node_ebs_volume_size" {
  description = "EBS volume size for broker nodes"
  type        = number
  default     = 100
}

variable "msk_encryption_in_transit_client_broker" {
  description = "Encryption in transit between clients and brokers"
  type        = string
  default     = "TLS"
}

variable "msk_encryption_in_transit_in_cluster" {
  description = "Encryption in transit within the cluster"
  type        = bool
  default     = true
}

variable "msk_configuration_name" {
  description = "Configuration name"
  type        = string
  default     = "dev-msk-configuration"
}

variable "msk_configuration_description" {
  description = "Configuration description"
  type        = string
  default     = "MSK cluster configuration"
}

variable "msk_configuration_server_properties" {
  description = "Server properties for configuration"
  type        = map(string)
  default     = {
    "auto.create.topics.enable" = "true"
    "delete.topic.enable"       = "true"
  }
}

variable "msk_jmx_exporter_enabled" {
  description = "Enable JMX exporter"
  type        = bool
  default     = true
}

variable "msk_node_exporter_enabled" {
  description = "Enable node exporter"
  type        = bool
  default     = true
}

variable "msk_cloudwatch_logs_enabled" {
  description = "Enable CloudWatch logs"
  type        = bool
  default     = true
}

variable "msk_client_authentication" {
  description = "Client authentication configuration"
  type        = any
  default     = {}
}

# Aurora Variables
variable "aurora_cluster_name" {
  description = "Aurora cluster name"
  type        = string
  default     = "dev-aurora-cluster"
}

variable "aurora_engine" {
  description = "Aurora database engine"
  type        = string
  default     = "aurora-postgresql"
}

variable "aurora_engine_version" {
  description = "Aurora engine version"
  type        = string
  default     = "17.5"
}

variable "aurora_master_username" {
  description = "Master username"
  type        = string
  default     = "root"
}

variable "aurora_manage_master_user_password" {
  description = "Whether to manage master user password with Secrets Manager"
  type        = bool
  default     = true
}

variable "aurora_manage_master_user_password_rotation" {
  description = "Whether to manage master user password rotation"
  type        = bool
  default     = false
}

variable "aurora_master_user_password_rotation_automatically_after_days" {
  description = "Number of days after which to rotate password automatically"
  type        = number
  default     = 30
}

variable "aurora_enabled_cloudwatch_logs_exports" {
  description = "List of log types to export to CloudWatch"
  type        = list(string)
  default     = ["postgresql"]
}

variable "aurora_performance_insights_enabled" {
  description = "Enable Performance Insights"
  type        = bool
  default     = true
}

variable "aurora_performance_insights_retention_period" {
  description = "Performance Insights retention period in days"
  type        = number
  default     = 7
}

variable "aurora_instance_class" {
  description = "Instance class for Aurora instances"
  type        = string
  default     = "db.r6g.large"
}

variable "aurora_skip_final_snapshot" {
  description = "Skip final snapshot"
  type        = bool
  default     = true
}

# NLB Variables
variable "nlb_enable_deletion_protection" {
  description = "Enable deletion protection for NLB"
  type        = bool
  default     = false
}

variable "nlb_enforce_sg_inbound_rules" {
  description = "Enforce security group inbound rules on private link traffic"
  type        = string
  default     = "off"
}

variable "nlb_security_group_ingress_rules" {
  description = "NLB Security group ingress rules"
  type        = any
  default     = {
    all_tcp = {
      from_port   = 80
      to_port     = 84
      ip_protocol = "tcp"
      description = "TCP traffic"
      cidr_ipv4   = "0.0.0.0/0"
    }
  }
}

variable "nlb_security_group_egress_rules" {
  description = "NLB Security group egress rules"
  type        = any
  default     = {
    all = {
      ip_protocol = "-1"
      cidr_ipv4   = "10.0.0.0/16"
    }
  }
}

variable "nlb_listeners" {
  description = "NLB Listener configurations"
  type        = any
  default     = {
    ex-tcp = {
      port     = 80
      protocol = "TCP"
      forward = {
        target_group_key = "ex-instance"
      }
    }
  }
}

variable "nlb_target_groups" {
  description = "NLB Target group configurations"
  type        = any
  default     = {
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
}

# S3 Variables
variable "s3_bucket_name" {
  description = "Name of the S3 bucket"
  type        = string
  default     = "dev-s3-bucket"
}

variable "s3_acl" {
  description = "ACL for the bucket"
  type        = string
  default     = "private"
}

variable "s3_control_object_ownership" {
  description = "Whether to manage S3 Bucket Ownership Controls"
  type        = bool
  default     = true
}

variable "s3_object_ownership" {
  description = "Object ownership"
  type        = string
  default     = "BucketOwnerPreferred"
}

variable "s3_versioning" {
  description = "Versioning configuration"
  type        = any
  default     = {
    enabled = true
  }
}

variable "s3_server_side_encryption_configuration" {
  description = "Server-side encryption configuration"
  type        = any
  default     = {
    rule = {
      apply_server_side_encryption_by_default = {
        sse_algorithm = "AES256"
      }
    }
  }
}

variable "s3_lifecycle_rule" {
  description = "Lifecycle rules"
  type        = any
  default     = []
}

variable "s3_block_public_acls" {
  description = "Block public ACLs"
  type        = bool
  default     = true
}

variable "s3_block_public_policy" {
  description = "Block public policy"
  type        = bool
  default     = true
}

variable "s3_ignore_public_acls" {
  description = "Ignore public ACLs"
  type        = bool
  default     = true
}

variable "s3_restrict_public_buckets" {
  description = "Restrict public buckets"
  type        = bool
  default     = true
}
