variable "environment" {
  description = "Environment name"
  type        = string
}

variable "role_name" {
  description = "Name of the IAM role"
  type        = string
}

variable "oidc_providers" {
  description = "Map of OIDC providers where each provider map should contain the provider ARN and namespace service accounts"
  type        = any
  default     = {}
}

variable "policies" {
  description = "Map of IAM policies to attach to the role"
  type        = map(string)
  default     = {}
}

variable "attach_ebs_csi_policy" {
  description = "Attach the EBS CSI policy to the role"
  type        = bool
  default     = false
}

variable "attach_efs_csi_policy" {
  description = "Attach the EFS CSI policy to the role"
  type        = bool
  default     = false
}

variable "attach_vpc_cni_policy" {
  description = "Attach the VPC CNI policy to the role"
  type        = bool
  default     = false
}

variable "attach_cluster_autoscaler_policy" {
  description = "Attach the Cluster Autoscaler policy to the role"
  type        = bool
  default     = false
}

variable "cluster_autoscaler_cluster_names" {
  description = "List of cluster names for Cluster Autoscaler policy"
  type        = list(string)
  default     = []
}

variable "attach_external_dns_policy" {
  description = "Attach the External DNS policy to the role"
  type        = bool
  default     = false
}

variable "external_dns_hosted_zone_arns" {
  description = "List of Route53 hosted zone ARNs for External DNS"
  type        = list(string)
  default     = []
}

variable "attach_cert_manager_policy" {
  description = "Attach the Cert Manager policy to the role"
  type        = bool
  default     = false
}

variable "cert_manager_hosted_zone_arns" {
  description = "List of Route53 hosted zone ARNs for Cert Manager"
  type        = list(string)
  default     = []
}

variable "attach_load_balancer_controller_policy" {
  description = "Attach the AWS Load Balancer Controller policy to the role"
  type        = bool
  default     = false
}
