
resource "azurerm_virtual_network" "vnet" {
  name                = "vnet-apim"
  location            = data.azurerm_resource_group.rg.location
  resource_group_name = data.azurerm_resource_group.rg.name
  address_space       = var.vnet_address_space
}


resource "azurerm_subnet" "apim" {
  name                 = "snet-apim"
  resource_group_name = data.azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = var.apim_subnet_prefix

}

//VPN
resource "azurerm_subnet" "gateway" {
  name                 = "GatewaySubnet"
  resource_group_name  = data.azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.10.255.0/27"]
}

resource "azurerm_public_ip" "vpn" {
  name                = "pip-vpn-gateway"
  location            = data.azurerm_resource_group.rg.location
  resource_group_name = data.azurerm_resource_group.rg.name
  allocation_method   = "Static"
  sku               = "Standard"
}

resource "azurerm_virtual_network_gateway" "vpn" {
  count               = var.enable_gateway ? 1 : 0
  name                = "vpn-gateway-demo"
  location            = data.azurerm_resource_group.rg.location
  resource_group_name = data.azurerm_resource_group.rg.name

  type     = "Vpn"
  vpn_type = "RouteBased"
  sku      = "VpnGw1"

  ip_configuration {
    name                          = "vpngw-ipconfig"
    public_ip_address_id          = azurerm_public_ip.vpn.id
    subnet_id                     = azurerm_subnet.gateway.id
  }
}
