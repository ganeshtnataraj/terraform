output "public_ip" {
  description = "Public IP of the VM"
  value       = module.vm.public_ip
}

output "subnet1_id" {
  value = module.network.subnet1_id
}

output "subnet2_id" {
  value = module.network.subnet2_id
}