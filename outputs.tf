output "public_ip_address" {
  description = "The public IP address of the VM."
  value = "${azurerm_linux_virtual_machine.mtc-vm.name}: ${azurerm_linux_virtual_machine.mtc-vm.public_ip_address}"
}
