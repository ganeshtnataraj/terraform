output "vm_id" {
  description = "VM ID"
  value       = azurerm_linux_virtual_machine.main.id
}

output "vm_public_ip" {
  description = "VM public IP"
  value       = azurerm_public_ip.vm.ip_address
}