terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.0"
    }
  }
}

provider "azurerm" {
  features {}

  subscription_id            = "4f7fe8cb-4054-403f-b426-536fb3e3538e"
  skip_provider_registration = true
}