terraform {

  required_version = ">= 1.0.0"

  required_providers {
    source  = "hashicorp/azurerm"
    version = "=3.0.0"
  }
}

provider "azurerm" {
  skip_provider_registration = true
  features {}
}