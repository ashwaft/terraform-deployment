/**********************************
* Terraform Block
* Settings for Terraform Behaviour.
***********************************/
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

# Provider Block
provider "aws" {
  region  = var.aws_region
  profile = "scb-bootcamp"
}

