resource "azurerm_virtual_network" "aksvnet" {
  name                = "${var.deployment_name}aksvirtualNetwork1"
  location            = "${azurerm_resource_group.k8s.location}"
  resource_group_name = "${azurerm_resource_group.k8s.name}"
  address_space       = ["10.1.0.0/16"]
}

resource "azurerm_subnet" "subnet" {
  name                 = "aksnodes"
  resource_group_name  = "${azurerm_resource_group.k8s.name}"
  address_prefix       = "10.1.0.0/24"
  virtual_network_name = "${azurerm_virtual_network.aksvnet.name}"
  service_endpoints = ["Microsoft.Sql"]
}