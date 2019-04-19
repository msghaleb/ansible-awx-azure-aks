provider "azurerm" {
  version = "~>1.25"
}

resource "azurerm_resource_group" "k8s" {
  name     = "${var.deployment_name}${var.resource_group_name}"
  location = "${var.location}"
}

resource "azurerm_log_analytics_workspace" "test" {
  name                = "${var.deployment_name}${var.log_analytics_workspace_name}"
  location            = "${var.log_analytics_workspace_location}"
  resource_group_name = "${azurerm_resource_group.k8s.name}"
  sku                 = "${var.log_analytics_workspace_sku}"
}

resource "azurerm_log_analytics_solution" "test" {
  solution_name         = "ContainerInsights"
  location              = "${azurerm_log_analytics_workspace.test.location}"
  resource_group_name   = "${azurerm_resource_group.k8s.name}"
  workspace_resource_id = "${azurerm_log_analytics_workspace.test.id}"
  workspace_name        = "${azurerm_log_analytics_workspace.test.name}"

  plan {
    publisher = "Microsoft"
    product   = "OMSGallery/ContainerInsights"
  }
}
