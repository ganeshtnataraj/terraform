terraform {
  required_version = ">= 1.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
}

provider "azurerm" {
  features {}
}

# Create subscription
module "subscription" {
  source = "./modules/subscription"
  
  subscription_name = var.subscription_name
  billing_scope    = var.billing_scope
}

# Create resource group
resource "azurerm_resource_group" "main" {
  name     = var.resource_group_name
  location = var.location
  
  depends_on = [module.subscription]
}

# Create network
module "network" {
  source = "./modules/network"
  
  resource_group_name = azurerm_resource_group.main.name
  location           = azurerm_resource_group.main.location
  vnet_name          = var.vnet_name
  vnet_address_space = var.vnet_address_space
}

# Create VM in vm-sn subnet
module "compute" {
  source = "./modules/compute"
  
  resource_group_name = azurerm_resource_group.main.name
  location           = azurerm_resource_group.main.location
  vm_name            = var.vm_name
  subnet_id          = module.network.vm_subnet_id
  admin_username     = var.admin_username
  admin_password     = var.admin_password
}

# Create PostgreSQL servers
module "database" {
  source = "./modules/database"
  
  resource_group_name     = azurerm_resource_group.main.name
  location               = azurerm_resource_group.main.location
  primary_server_name    = var.primary_postgres_server_name
  replica_server_name    = var.replica_postgres_server_name
  subnet_id              = module.network.db_subnet_id
  administrator_login    = var.postgres_admin_username
  administrator_password = var.postgres_admin_password
}

# Create AKS cluster
module "aks" {
  source = "./modules/aks"
  
  resource_group_name = azurerm_resource_group.main.name
  location           = azurerm_resource_group.main.location
  aks_cluster_name   = var.aks_cluster_name
  subnet_id          = module.network.kubernetes_subnet_id
  node_count         = var.aks_node_count
  vm_size            = var.aks_vm_size
}