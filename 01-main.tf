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

  # Eventually will be abstracted out to allow for multiple env config
  backend "s3" {
    bucket         = "terraform-mars"
    key            = "terraform-deployment/dev/terraform.tfstate"
    region         = "us-west-2"
    dynamodb_table = "terraform-deployment-dev-tfstate"
    profile        = "scb-bootcamp"
  }
}

# Provider Block
provider "aws" {
  region  = var.aws_region
  profile = "scb-bootcamp"
}

