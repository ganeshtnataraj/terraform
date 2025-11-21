variable "subscription_name" {
  description = "Name of the new subscription"
  type        = string
}

variable "billing_scope" {
  description = "Billing scope for the subscription"
  type        = string
}

variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
  default     = "East US"
}

variable "vnet_name" {
  description = "Name of the virtual network"
  type        = string
}

variable "vnet_address_space" {
  description = "Address space for the VNet"
  type        = list(string)
  default     = ["10.0.0.0/16"]
}

variable "vm_name" {
  description = "Name of the virtual machine"
  type        = string
}

variable "admin_username" {
  description = "Admin username for the VM"
  type        = string
  sensitive   = true
}

variable "admin_password" {
  description = "Admin password for the VM"
  type        = string
  sensitive   = true
}

variable "primary_postgres_server_name" {
  description = "Name of the primary PostgreSQL server"
  type        = string
}

variable "replica_postgres_server_name" {
  description = "Name of the replica PostgreSQL server"
  type        = string
}

variable "postgres_admin_username" {
  description = "Admin username for PostgreSQL"
  type        = string
  sensitive   = true
}

variable "postgres_admin_password" {
  description = "Admin password for PostgreSQL"
  type        = string
  sensitive   = true
}

variable "aks_cluster_name" {
  description = "Name of the AKS cluster"
  type        = string
}

variable "aks_node_count" {
  description = "Number of AKS nodes"
  type        = number
  default     = 4
}

variable "aks_vm_size" {
  description = "VM size for AKS nodes"
  type        = string
  default     = "Standard_D4s_v3"
}