output "public_ip_address" {
  value = data.azurerm_public_ip.vm_public_ip.ip_address
  description = "Public IP address of the VM."
}