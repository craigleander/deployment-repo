terraform {
  required_version = ">= 1.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.region
}

# Provider for Global DB secondary region (example)
provider "aws" {
  alias  = "secondary"
  region = var.secondary_region
}
