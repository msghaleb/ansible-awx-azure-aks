resource "azurerm_resource_group" "awx_pgsql" {
  name     = "azure-db-k8stest"
  location = "West Europe"
}

resource "azurerm_postgresql_server" "awx_pgsql" {
  name                = "awx-postgresql-moga"
  location            = "${azurerm_resource_group.awx_pgsql.location}"
  resource_group_name = "${azurerm_resource_group.awx_pgsql.name}"

  sku {
    name     = "B_Gen5_1"
    capacity = 1
    tier     = "Basic"
    family   = "Gen5"
  }

  storage_profile {
    storage_mb            = 20480
    backup_retention_days = 7
    geo_redundant_backup  = "Disabled"
  }

  administrator_login          = "${var.postgresql_username}"
  administrator_login_password = "${var.postgresql_password}"
  version                      = "10"
  ssl_enforcement              = "Disabled"
}
