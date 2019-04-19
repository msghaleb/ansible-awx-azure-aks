data "template_file" "init" {
  template = "${file("inventory.ini.tpl")}"
  vars = {
  pg_hostname = "${azurerm_postgresql_server.awx_pgsql.fqdn}"
  kubernetes_context    ="${azurerm_kubernetes_cluster.k8s.name}"
  pg_username           ="${var.postgresql_username}@${azurerm_postgresql_server.awx_pgsql.name}"
  pg_password           ="${var.postgresql_password}"
  rabbitmq_password     ="${var.rabbitmq_password}"
  rabbitmq_erlang_cookie= "cookiemonster"
  admin_user            = "admin"
  admin_password        = "${var.awxadmin_password}"
  secret_key            = "${var.secret_key}"
  }
}

resource "local_file" "inventory" {
    content     = "${data.template_file.init.rendered}"
    filename = "${path.module}/../inventory.ini"
}
