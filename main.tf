module "vm-1" {
  source              = "./modules/vm-1"
  resource_group_name = var.resource_group_name
  region              = var.region
  host_os             = var.host_os
  vm_username         = var.vm_username
  subnet_id           = azurerm_subnet.A-subnet.id
  depends_on          = [azurerm_resource_group.A-rg]

  lifecycle {
    create_before_destroy = true
  }
}
