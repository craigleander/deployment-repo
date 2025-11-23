module "msk_cluster" {
  source  = "terraform-aws-modules/msk-kafka-cluster/aws"
  version = "~> 2.0"

  name                   = var.cluster_name
  kafka_version          = var.kafka_version
  number_of_broker_nodes = var.number_of_broker_nodes
  enhanced_monitoring    = var.enhanced_monitoring

  broker_node_client_subnets  = var.broker_node_client_subnets
  broker_node_instance_type   = var.broker_node_instance_type
  broker_node_security_groups = var.broker_node_security_groups
  broker_node_storage_info = {
    ebs_storage_info = { 
      volume_size = var.broker_node_ebs_volume_size 
    }
  }

  encryption_in_transit_client_broker = var.encryption_in_transit_client_broker
  encryption_in_transit_in_cluster    = var.encryption_in_transit_in_cluster

  configuration_name              = var.configuration_name
  configuration_description       = var.configuration_description
  configuration_server_properties = var.configuration_server_properties

  jmx_exporter_enabled    = var.jmx_exporter_enabled
  node_exporter_enabled   = var.node_exporter_enabled
  cloudwatch_logs_enabled = var.cloudwatch_logs_enabled

  client_authentication = var.client_authentication

  tags = {
    Environment = var.environment
    Terraform   = "true"
  }
}
