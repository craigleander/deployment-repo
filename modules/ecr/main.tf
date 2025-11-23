module "ecr" {
  source  = "terraform-aws-modules/ecr/aws"
  version = "~> 2.0"

  repository_name = var.repository_name
  repository_type = var.repository_type

  repository_read_write_access_arns = var.repository_read_write_access_arns
  repository_read_access_arns       = var.repository_read_access_arns

  create_lifecycle_policy     = var.create_lifecycle_policy
  repository_lifecycle_policy = var.repository_lifecycle_policy

  repository_force_delete = var.repository_force_delete

  repository_image_tag_mutability = var.repository_image_tag_mutability

  repository_encryption_type = var.repository_encryption_type
  repository_kms_key         = var.repository_kms_key

  repository_image_scan_on_push = var.repository_image_scan_on_push

  # Public repository catalog data
  public_repository_catalog_data = var.public_repository_catalog_data

  tags = {
    Environment = var.environment
    Terraform   = "true"
  }
}
