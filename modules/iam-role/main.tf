module "iam_role" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-role"
  version = "~> 5.0"

  name = var.role_name

  create_instance_profile = var.create_instance_profile

  trust_policy_permissions = var.trust_policy_permissions

  policies = var.policies

  # GitHub OIDC
  enable_github_oidc = var.enable_github_oidc
  oidc_subjects      = var.oidc_subjects

  # Generic OIDC
  enable_oidc        = var.enable_oidc
  oidc_provider_urls = var.oidc_provider_urls
  oidc_audiences     = var.oidc_audiences

  # SAML 2.0
  enable_saml       = var.enable_saml
  saml_provider_ids = var.saml_provider_ids

  tags = {
    Environment = var.environment
    Terraform   = "true"
  }
}
