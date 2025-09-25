variable "location" {
  type    = string
  default = "East US"
}

variable "vm_admin_username" {
  type    = string
  default = "azureuser"
}

variable "vm_admin_password" {
  type    = string
  default = "Password1234!" # ⚠️ Change in production
}