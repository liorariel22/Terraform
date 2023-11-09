output "public_ip_address" {
  description = "The public IP address of the VM."
  #value       = "${azurerm_linux_virtual_machine.mtc-vm.name}: ${data.external.ip_address.result.IP_ADDRESS}"
  #https://registry.terraform.io/providers/hashicorp/azurerm/3.0.0/docs/resources/linux_virtual_machine

  value = "${azurerm_linux_virtual_machine.mtc-vm.name}: ${azurerm_linux_virtual_machine.mtc-vm.public_ip_address}"
}