resource "azurerm_public_ip" "A-ip" {
  name                = "Azure-tf-project-ip"
  resource_group_name = var.resource_group_name
  location            = var.region
  allocation_method   = "Dynamic"
  tags = {
    environment = "test"
  }
}

resource "azurerm_network_interface" "A-nic" {
  name                = "Azure-tf-project-nic"
  location            = var.region
  resource_group_name = var.resource_group_name
  ip_configuration {
    name                          = "internal"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.A-ip.id
  }
  depends_on          = [azurerm_public_ip.A-ip]
  tags = {
    environment = "test"
  }
}

resource "azurerm_linux_virtual_machine" "A-vm-1" {
  name                  = "Azure-tf-project-vm-1"
  resource_group_name   = var.resource_group_name
  location              = var.region
  size                  = "Standard_B1s"
  admin_username        = "adminuser"
  network_interface_ids = [azurerm_network_interface.A-nic.id]
  custom_data           = filebase64("${path.module}/customdata.tpl")
  admin_ssh_key {
    username = var.vm_username
    public_key = file("~/.ssh/mtcazurekey.pub")
  }
  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }
  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }
  depends_on            = [azurerm_network_interface.A-nic]
  tags = {
    environment = "test"
  }
}
