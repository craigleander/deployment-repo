################################################################################
# API Gateway
################################################################################

output "api_id" {
  description = "The API identifier"
  value       = module.apigateway_v2.api_id
}

output "api_arn" {
  description = "The ARN of the API"
  value       = module.apigateway_v2.api_arn
}

output "api_endpoint" {
  description = "The URI of the API"
  value       = module.apigateway_v2.api_endpoint
}

output "api_execution_arn" {
  description = "The ARN prefix to be used in an aws_lambda_permission's source_arn attribute"
  value       = module.apigateway_v2.api_execution_arn
}

################################################################################
# Stage
################################################################################

output "stage_id" {
  description = "The stage identifier"
  value       = module.apigateway_v2.stage_id
}

output "stage_arn" {
  description = "The stage ARN"
  value       = module.apigateway_v2.stage_arn
}

output "stage_execution_arn" {
  description = "The ARN prefix to be used in an aws_lambda_permission's source_arn attribute for stage"
  value       = module.apigateway_v2.stage_execution_arn
}

output "stage_invoke_url" {
  description = "The URL to invoke the API pointing to the stage"
  value       = module.apigateway_v2.stage_invoke_url
}

################################################################################
# VPC Link
################################################################################

output "vpc_links" {
  description = "Map of VPC Links created and their attributes"
  value       = module.apigateway_v2.vpc_links
}
