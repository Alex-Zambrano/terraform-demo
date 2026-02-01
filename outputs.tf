output "apim_name" {
  value = azurerm_api_management.apim.name
}

output "apim_private_ips" {
  value = azurerm_api_management.apim.private_ip_addresses
}
