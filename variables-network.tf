variable "vnet_name" {
  description = "Nombre de la Virtual Network"
  type        = string
}

variable "vnet_address_space" {
  description = "CIDR de la VNet"
  type        = list(string)
}

variable "apim_subnet_prefix" {
  description = "CIDR de la subnet para APIM"
  type        = list(string)
}


variable "enable_gateway" {
  type    = bool
  default = true
}