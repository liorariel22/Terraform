data "external" "update_ssh_config" {
  depends_on = [azurerm_linux_virtual_machine.A-vm-1]
  program    = ["${path.module}/update_ssh_config.sh"]
  query = {
    ip   = azurerm_linux_virtual_machine.A-vm-1.public_ip_address
    os   = var.host_os
    user = azurerm_linux_virtual_machine.A-vm-1.admin_username
  }
}

data "azurerm_public_ip" "vm_public_ip" {
  depends_on          = [azurerm_linux_virtual_machine.A-vm-1]
  name                = azurerm_public_ip.A-ip.name
  resource_group_name = var.resource_group_name
}