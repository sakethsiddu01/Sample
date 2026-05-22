terraform {
  required_version = ">= 1.0.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
  
  # This tells Terraform to save your state file in your S3 bucket
  backend "s3" {} 
}

provider "aws" {
  region = "ap-south-1"
}
