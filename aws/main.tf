terraform {

  required_version = ">= 1.0.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  backend "s3" {
    bucket = "terraform-bucket"
    key    = "aws-vpc/terraform.tfstate"
    region = "eu-central-1"
  }

}

provider "aws" {
  region = "eu-central-1"
  default_tags {
    tags = {
      owner      = "pauloalexandre"
      managed-by = "terraform"
    }
  }
}
