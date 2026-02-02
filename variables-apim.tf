
variable "resource_group_name" {
  description = "Resource Group existente"
  type        = string
}


variable "apim_name" {
  type        = string
  description = "Nombre del API Management"
}

variable "publisher_name" {
  type = string
}

variable "publisher_email" {
  type = string
}


variable "apim_sku" {
  description = "SKU de APIM"
  type        = string
  default     = "Standard_1"
}

variable "enable_apim" {
  type    = bool
  default = true
}