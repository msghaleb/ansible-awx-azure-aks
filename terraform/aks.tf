resource "azurerm_kubernetes_cluster" "k8s" {
  name                = "${var.deployment_name}${var.cluster_name}"
  location            = "${azurerm_resource_group.k8s.location}"
  resource_group_name = "${azurerm_resource_group.k8s.name}"
  dns_prefix          = "${var.deployment_name}${var.dns_prefix}"

  linux_profile {
    admin_username = "ubuntu"

    ssh_key {
      key_data = "${file("${var.ssh_public_key}")}"
    }
  }

  agent_pool_profile {
    name            = "agentpool"
    count           = "${var.agent_count}"
    vm_size         = "Standard_D4s_v3"
    os_type         = "Linux"
    os_disk_size_gb = 30
    vnet_subnet_id  = "${azurerm_subnet.subnet.id}"
  }

  service_principal {
    client_id     = "${var.client_id}"
    client_secret = "${var.client_secret}"
  }

  addon_profile {
    oms_agent {
      enabled                    = true
      log_analytics_workspace_id = "${azurerm_log_analytics_workspace.test.id}"
    }
    http_application_routing {
      enabled = true
    }
  }

  tags {
    Environment = "Development"
  }
}

resource "local_file" "kubeconfig" {
    sensitive_content     = "${azurerm_kubernetes_cluster.k8s.kube_config_raw}"
    filename              = "${path.module}/../kubeconfig"
}