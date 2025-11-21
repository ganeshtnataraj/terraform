output "aks_cluster_name" {
  description = "AKS cluster name"
  value       = azurerm_kubernetes_cluster.main.name
}

output "kube_config" {
  description = "Kube config"
  value       = azurerm_kubernetes_cluster.main.kube_config_raw
  sensitive   = true
}