output "public_ip_address" {
  value       = module.vm-1.public_ip_address
  description = "Public IP address of the VM."
}

output "subnet_id" {
  value = azurerm_subnet.A-subnet.id
}