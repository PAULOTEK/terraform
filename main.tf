terraform {

  required_version = ">= 1.0.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
    }
  }

}

provider "aws" {
  region = "us-west-2"
  default_tags {
    tags = {
      owner      = "pauloalexandre"
      managed-by = "terraform"
    }
  }
}

provider "azurerm" {
  skip_provider_registration = true
  features {}
}