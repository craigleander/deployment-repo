variable "environment" {
  description = "Environment name"
  type        = string
}

variable "instance_name" {
  description = "Name of the EC2 instance"
  type        = string
}

variable "ami" {
  description = "ID of AMI to use for the instance"
  type        = string
}

variable "instance_type" {
  description = "The type of instance to start"
  type        = string
  default     = "t3.micro"
}

variable "availability_zone" {
  description = "AZ to start the instance in"
  type        = string
  default     = null
}

variable "subnet_id" {
  description = "The VPC Subnet ID to launch in"
  type        = string
}

variable "vpc_security_group_ids" {
  description = "A list of security group IDs to associate with"
  type        = list(string)
  default     = []
}

variable "create_eip" {
  description = "Determines whether an EIP is created for the instance"
  type        = bool
  default     = false
}

variable "disable_api_stop" {
  description = "If true, enables EC2 Instance Stop Protection"
  type        = bool
  default     = false
}

variable "disable_api_termination" {
  description = "If true, enables EC2 Instance Termination Protection"
  type        = bool
  default     = false
}

variable "create_iam_instance_profile" {
  description = "Determines whether an IAM instance profile is created"
  type        = bool
  default     = false
}

variable "iam_role_description" {
  description = "Description of the role"
  type        = string
  default     = null
}

variable "iam_role_policies" {
  description = "Map of IAM policies to attach to the IAM role"
  type        = map(string)
  default     = {}
}

variable "user_data_base64" {
  description = "Base64-encoded user data to provide when launching the instance"
  type        = string
  default     = null
}

variable "user_data_replace_on_change" {
  description = "When used in combination with user_data will trigger a destroy and recreate when set to true"
  type        = bool
  default     = false
}

variable "cpu_options" {
  description = "CPU options for the instance"
  type        = any
  default     = {}
}

variable "enable_volume_tags" {
  description = "Whether to enable volume tags"
  type        = bool
  default     = true
}

variable "root_block_device" {
  description = "Customize details about the root block device of the instance"
  type        = any
  default     = {}
}

variable "ebs_block_device" {
  description = "Additional EBS block devices to attach to the instance"
  type        = any
  default     = {}
}

variable "metadata_options" {
  description = "Customize the metadata options of the instance"
  type        = any
  default     = {
    http_endpoint               = "enabled"
    http_tokens                 = "required"
    http_put_response_hop_limit = 1
    instance_metadata_tags      = "enabled"
  }
}

variable "monitoring" {
  description = "If true, the launched EC2 instance will have detailed monitoring enabled"
  type        = bool
  default     = false
}

variable "associate_public_ip_address" {
  description = "Whether to associate a public IP address with an instance in a VPC"
  type        = bool
  default     = false
}
