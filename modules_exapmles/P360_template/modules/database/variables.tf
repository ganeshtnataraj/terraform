variable "resource_group_name" {
  description = "Resource group name"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
}

variable "primary_server_name" {
  description = "Primary server name"
  type        = string
}

variable "replica_server_name" {
  description = "Replica server name"
  type        = string
}

variable "subnet_id" {
  description = "Subnet ID"
  type        = string
}

variable "administrator_login" {
  description = "Administrator login"
  type        = string
  sensitive   = true
}

variable "administrator_password" {
  description = "Administrator password"
  type        = string
  sensitive   = true
}