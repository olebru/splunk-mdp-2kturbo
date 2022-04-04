terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "2.66.0"
    }
    azurecaf = {
      source = "aztfmod/azurecaf"
    }
    random = {
      source = "hashicorp/random"
      version = ">= 1.0"
    }
  }

  required_version = ">= 0.14"
}

