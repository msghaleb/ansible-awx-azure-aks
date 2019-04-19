resource "azurerm_resource_group" "awx_pgsql" {
  name     = "${var.deployment_name}${var.postgresql_resource_group_name}"
  location = "${var.location}"
}

resource "azurerm_postgresql_server" "awx_pgsql" {
  name                = "${var.deployment_name}${var.postgresql_server_name}"
  location            = "${azurerm_resource_group.awx_pgsql.location}"
  resource_group_name = "${azurerm_resource_group.awx_pgsql.name}"

  sku {
    name     = "${var.postgresql_sku_name}"
    capacity = "${var.postgresql_sku_capacity}"
    tier     = "${var.postgresql_sku_tier}"
    family   = "${var.postgresql_sku_family}"
  }

  storage_profile {
    storage_mb            = "${var.postgresql_storage_mb}"
    backup_retention_days = "${var.postgresql_backup_retention_days}"
    geo_redundant_backup  = "${var.postgresql_geo_redundant_backup}"
  }

  administrator_login          = "${var.postgresql_username}"
  administrator_login_password = "${var.postgresql_password}"
  version                      = "${var.postgresql_version}"
  ssl_enforcement              = "${var.postgresql_ssl_enforcement}"

}

resource "azurerm_postgresql_virtual_network_rule" "test" {
  name                                 = "postgresql-awx-vnet-rule"
  resource_group_name                  = "${azurerm_resource_group.awx_pgsql.name}"
  server_name                          = "${azurerm_postgresql_server.awx_pgsql.name}"
  subnet_id                            = "${azurerm_subnet.subnet.id}"
  ignore_missing_vnet_service_endpoint = true
}
