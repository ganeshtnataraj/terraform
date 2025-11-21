output "subscription_id" {
  description = "ID of the created subscription"
  value       = module.subscription.subscription_id
}

output "vnet_id" {
  description = "ID of the created VNet"
  value       = module.network.vnet_id
}

output "vm_public_ip" {
  description = "Public IP of the VM"
  value       = module.compute.vm_public_ip
}

output "primary_postgres_fqdn" {
  description = "FQDN of the primary PostgreSQL server"
  value       = module.database.primary_postgres_fqdn
}

output "replica_postgres_fqdn" {
  description = "FQDN of the replica PostgreSQL server"
  value       = module.database.replica_postgres_fqdn
}

output "aks_cluster_name" {
  description = "Name of the AKS cluster"
  value       = module.aks.aks_cluster_name
}

output "kube_config" {
  description = "Kubernetes configuration"
  value       = module.aks.kube_config
  sensitive   = true
}