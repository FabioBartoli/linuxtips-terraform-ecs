terraform {
  required_version = ">= 1.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  # Mesmo bucket da stack ECS, com uma key própria para a rede
  backend "s3" {
    bucket = "linuxtips-curso-actions"
    key    = "stack-vpc/terraform.tfstate"
    region = "us-east-1"
  }
}

provider "aws" {
  region = var.aws_region

  default_tags {
    tags = var.common_tags
  }
}
