# Terraform Settings Block
terraform {
  required_version = "~> 1.9.5" # Minor patches
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0" # Optional but recommended in production
    }
  }
}

# Provider Block for local CLI
# provider "aws" {
#   # AWS Credentials Profile configured on local  $HOME/.aws/credentials
#   profile = "default"
#   region  = var.aws_region
# }

# Provider Block for Cloud Terraform
provider "aws" {
  access_key = var.AWS_ACCESS_KEY_ID
  secret_key = var.AWS_SECRET_ACCESS_KEY
  region     = var.aws_region
}