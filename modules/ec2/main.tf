module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 5.0"

  name = var.instance_name

  ami                    = var.ami
  instance_type          = var.instance_type
  availability_zone      = var.availability_zone
  subnet_id              = var.subnet_id
  vpc_security_group_ids = var.vpc_security_group_ids

  create_eip           = var.create_eip
  disable_api_stop     = var.disable_api_stop
  disable_api_termination = var.disable_api_termination

  create_iam_instance_profile = var.create_iam_instance_profile
  iam_role_description        = var.iam_role_description
  iam_role_policies           = var.iam_role_policies

  user_data_base64            = var.user_data_base64
  user_data_replace_on_change = var.user_data_replace_on_change

  cpu_options        = var.cpu_options
  enable_volume_tags = var.enable_volume_tags
  root_block_device  = var.root_block_device
  ebs_block_device   = var.ebs_block_device

  metadata_options = var.metadata_options

  monitoring                  = var.monitoring
  associate_public_ip_address = var.associate_public_ip_address

  tags = {
    Environment = var.environment
    Terraform   = "true"
  }
}
