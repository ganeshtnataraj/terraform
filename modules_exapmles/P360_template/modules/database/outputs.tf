output "primary_postgres_fqdn" {
  description = "Primary PostgreSQL FQDN"
  value       = azurerm_postgresql_flexible_server.primary.fqdn
}

output "replica_postgres_fqdn" {
  description = "Replica PostgreSQL FQDN"
  value       = azurerm_postgresql_flexible_server.replica.fqdn
}