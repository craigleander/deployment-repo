module "iam_role_for_service_accounts" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-role-for-service-accounts"
  version = "~> 5.0"

  name = var.role_name

  oidc_providers = var.oidc_providers

  policies = var.policies

  # Pre-defined policies for common EKS add-ons
  attach_ebs_csi_policy            = var.attach_ebs_csi_policy
  attach_efs_csi_policy            = var.attach_efs_csi_policy
  attach_vpc_cni_policy            = var.attach_vpc_cni_policy
  attach_cluster_autoscaler_policy = var.attach_cluster_autoscaler_policy
  cluster_autoscaler_cluster_names = var.cluster_autoscaler_cluster_names
  attach_external_dns_policy       = var.attach_external_dns_policy
  external_dns_hosted_zone_arns    = var.external_dns_hosted_zone_arns
  attach_cert_manager_policy       = var.attach_cert_manager_policy
  cert_manager_hosted_zone_arns    = var.cert_manager_hosted_zone_arns
  attach_load_balancer_controller_policy = var.attach_load_balancer_controller_policy

  tags = {
    Environment = var.environment
    Terraform   = "true"
  }
}
