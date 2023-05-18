terraform {
  cloud {
    organization = "sunkaleabhishek"

    workspaces {
      name = "lirrok"
    }
  }
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.54.0"
    }
    azuread = {
      source  = "hashicorp/azuread"
      version = "~> 2.15.0"
    }

  }
}

provider "azurerm" {
  subscription_id = "d3bfb580-f611-42bc-9949-43dc50aaea36"
  tenant_id = "ae16116c-272b-4b41-bcde-faae7cbd75fd"
  client_id = "d0dbe90b-de21-404b-9f25-f7ef71bcdff2"
  client_secret = "KXt8Q~21sjOIoc9ATjQxHam~Hz4Us92IIaCi4cE6"
  features {}  
}
provider "azuread" {
  tenant_id = "ae16116c-272b-4b41-bcde-faae7cbd75fd"  
}