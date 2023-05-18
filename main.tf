/*

The following links provide the documentation for the new blocks used
in this terraform configuration file

1.azurerm_subnet - https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet

*/



resource "azurerm_resource_group" "appgrp" {
  name     = "${terraform.workspace}-grp"
  location = local.location  
}

resource "azurerm_virtual_network" "appnetwork" {
  name                = "${terraform.workspace}-VNET"
  location            = local.location
  resource_group_name = azurerm_resource_group.appgrp.name
  address_space       = [local.address_space[terraform.workspace]]  
  
   depends_on = [
     azurerm_resource_group.appgrp
   ]
  }


  resource "azurerm_subnet" "subnetA" {
  name                 = "${terraform.workspace}-subnetA"
  resource_group_name  = azurerm_resource_group.appgrp.name
  virtual_network_name = azurerm_virtual_network.appnetwork.name
  address_prefixes     = [cidrsubnet(local.address_space["${terraform.workspace}"],8,0)]
  depends_on = [
    azurerm_virtual_network.appnetwork
  ]
}

