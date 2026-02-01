resource "azurerm_api_management" "apim" {
  name                = var.apim_name
  location            = data.azurerm_resource_group.rg.location
  resource_group_name = data.azurerm_resource_group.rg.name

  publisher_name  = var.publisher_name
  publisher_email = var.publisher_email

  #sku_name = "Premium_1"
  sku_name = "Standard_1"

#   virtual_network_type = "Internal"

#   virtual_network_configuration {
#     subnet_id = azurerm_subnet.apim.id
#   }

  identity {
    type = "SystemAssigned"
  }

  protocols {
    enable_http2 = true
  }

  tags = {
    environment = "dev"
    managed_by  = "terraform"
  }
}
