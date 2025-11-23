module "apigateway_v2" {
  source  = "terraform-aws-modules/apigateway-v2/aws"
  version = "~> 5.0"

  name          = var.api_name
  description   = var.description
  protocol_type = var.protocol_type

  cors_configuration = var.cors_configuration

  # Custom Domain
  create_domain_name = var.create_domain_name
  domain_name        = var.domain_name
  domain_name_certificate_arn = var.domain_name_certificate_arn

  # Routes & Integration(s)
  routes = var.routes

  # VPC Link
  vpc_links = var.vpc_links

  # Stage
  stage_name        = var.stage_name
  stage_description = var.stage_description
  stage_variables   = var.stage_variables

  # Access logs
  stage_access_log_settings = var.stage_access_log_settings

  tags = {
    Environment = var.environment
    Terraform   = "true"
  }
}
