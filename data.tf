#data "external" "ip_address" {
#  depends_on = [azurerm_linux_virtual_machine.mtc-vm]
#  program    = ["bash", "${path.module}/ip-allocation.sh", "mtc-ip", "mtc-resources"]
#}

data "external" "update_ssh_config" {
  depends_on = [azurerm_linux_virtual_machine.mtc-vm]

  program = ["${path.module}/update_ssh_config.sh"]
  query = {
    ip   = azurerm_linux_virtual_machine.mtc-vm.public_ip_address
    os   = var.host_os
    user = azurerm_linux_virtual_machine.mtc-vm.admin_username
  }
}

