resource "azurerm_postgresql_flexible_server" "primary" {
  name                   = var.primary_server_name
  resource_group_name    = var.resource_group_name
  location               = var.location
  version                = "13"
  delegated_subnet_id    = var.subnet_id
  private_dns_zone_id    = azurerm_private_dns_zone.main.id
  administrator_login    = var.administrator_login
  administrator_password = var.administrator_password
  zone                   = "1"

  storage_mb = 32768

  sku_name = "GP_Standard_D2s_v3"

  depends_on = [azurerm_private_dns_zone_virtual_network_link.main]
}

resource "azurerm_postgresql_flexible_server" "replica" {
  name                   = var.replica_server_name
  resource_group_name    = var.resource_group_name
  location               = var.location
  version                = "13"
  delegated_subnet_id    = var.subnet_id
  private_dns_zone_id    = azurerm_private_dns_zone.main.id
  administrator_login    = var.administrator_login
  administrator_password = var.administrator_password
  zone                   = "2"
  create_mode            = "Replica"
  source_server_id       = azurerm_postgresql_flexible_server.primary.id

  storage_mb = 32768

  sku_name = "GP_Standard_D2s_v3"

  depends_on = [azurerm_private_dns_zone_virtual_network_link.main]
}

resource "azurerm_private_dns_zone" "main" {
  name                = "private.postgres.database.azure.com"
  resource_group_name = var.resource_group_name
}

resource "azurerm_private_dns_zone_virtual_network_link" "main" {
  name                  = "${var.primary_server_name}-vnet-link"
  private_dns_zone_name = azurerm_private_dns_zone.main.name
  virtual_network_id    = split("/subnets/", var.subnet_id)[0]
  resource_group_name   = var.resource_group_name
}