resource_group_name = "1-fe63533a-playground-sandbox"

# Red
vnet_name           = "vnet-apim-demo"
vnet_address_space  = ["10.10.0.0/16"]
apim_subnet_prefix  = ["10.10.1.0/24"]
enable_gateway = false

# APIM
apim_name       = "apim-demo-standard"
publisher_name  = "Demo Corporativa"
publisher_email = "apim@empresa.com"
enable_apim = false
