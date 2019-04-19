variable "client_id" {}
variable "client_secret" {}

variable "deployment_name" {
  description = "This is your prefx for the whole deployment"
  default = "deplyment_prefix"
}

#############################################################################################################
########################################## AKS analytics vars ###############################################
#############################################################################################################
variable "agent_count" {
  description = "The number of nodes needed for your AKS cluster"
  default = 1
}

variable "ssh_public_key" {
  default = "~/.ssh/id_rsa.pub"
}

variable "dns_prefix" {
  default = "k8stest"
}

variable cluster_name {
  default = "k8stest"
}

variable resource_group_name {
  default = "azure-k8stest"
}

variable location {
  default = "West Europe"
}

#############################################################################################################
########################################## Log analytics vars ###############################################
#############################################################################################################
variable log_analytics_workspace_name {
  default = "testLogAnalyticsWorkspaceName"
}

# refer https://azure.microsoft.com/global-infrastructure/services/?products=monitor for log analytics available regions
variable log_analytics_workspace_location {
  default = "westeurope"
}

# refer https://azure.microsoft.com/pricing/details/monitor/ for log analytics pricing
variable log_analytics_workspace_sku {
  default = "PerGB2018"
}
#############################################################################################################
########################################### Postgres SQL vars ###############################################
#############################################################################################################

variable postgresql_resource_group_name {
  default = "db-k8stest"
} 

variable postgresql_server_name {
  default = "pgsql-db-server"
}

variable postgresql_username {
  default = "awx"
}
variable postgresql_password {}
variable postgresql_sku_name {
  default = "B_Gen5_1"
}
variable postgresql_sku_capacity {
  default = 1
}          
variable postgresql_sku_tier {
  default = "Basic"
}                       
variable postgresql_sku_family {
  default = "Gen5"
} 
variable postgresql_storage_mb {
  default = "20480"
}          
variable postgresql_backup_retention_days {
  default = 7
}    
variable postgresql_geo_redundant_backup {
  default = "Disabled"
} 
variable postgresql_version {
  default = "10"
}
variable postgresql_ssl_enforcement {
  default = "Enabled"
}

################### rabbitmq
variable rabbitmq_password {}

################### AWX
variable awxadmin_password  {}
variable secret_key  {}