# Use existing resource group
data "azurerm_resource_group" "rg" {
  name = "test-terraform"
}

module "network" {
  source              = "./modules/network"
  resource_group_name = data.azurerm_resource_group.rg.name
  location            = data.azurerm_resource_group.rg.location
}

module "vm" {
  source              = "./modules/vm"
  resource_group_name = data.azurerm_resource_group.rg.name
  location            = data.azurerm_resource_group.rg.location
  subnet_id           = module.network.subnet1_id
  admin_username      = var.vm_admin_username
  admin_password      = var.vm_admin_password
}
