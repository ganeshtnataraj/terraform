variable "resource_group_name" {
  description = "Resource group name"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
}

variable "aks_cluster_name" {
  description = "AKS cluster name"
  type        = string
}

variable "subnet_id" {
  description = "Subnet ID"
  type        = string
}

variable "node_count" {
  description = "Number of nodes"
  type        = number
  default     = 4
}

variable "vm_size" {
  description = "VM size"
  type        = string
  default     = "Standard_D4s_v3"
}