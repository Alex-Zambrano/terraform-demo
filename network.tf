# resource "azurerm_resource_group" "rg" {
#   name     = var.resource_group_name
#   location = var.location
# }

data "azurerm_resource_group" "rg" {
  name = "1-fdfdf15f-playground-sandbox"
}


resource "azurerm_virtual_network" "vnet" {
  name                = "vnet-apim"
  location            = data.azurerm_resource_group.rg.location
  resource_group_name = data.azurerm_resource_group.rg.name
  address_space       = ["10.10.0.0/16"]
}


resource "azurerm_subnet" "apim" {
  name                 = "snet-apim"
  resource_group_name = data.azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.10.10.0/27"]
}
