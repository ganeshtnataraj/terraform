output "vnet_id" {
  description = "VNet ID"
  value       = azurerm_virtual_network.main.id
}

output "vm_subnet_id" {
  description = "VM subnet ID"
  value       = azurerm_subnet.vm.id
}

output "kubernetes_subnet_id" {
  description = "Kubernetes subnet ID"
  value       = azurerm_subnet.kubernetes.id
}

output "db_subnet_id" {
  description = "Database subnet ID"
  value       = azurerm_subnet.db.id
}