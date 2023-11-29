resource "azurerm_resource_group" "A-rg" {
  name     = "Azure-tf-project-rg"
  location = "East US"
  tags = {
    environment = "test"
  }
}

resource "azurerm_virtual_network" "A-vnet" {
  name                = "Azure-tf-project-network"
  resource_group_name = azurerm_resource_group.A-rg.name
  location            = azurerm_resource_group.A-rg.location
  address_space       = ["10.123.0.0/16"]
  tags = {
    environment = "test"
  }
}

resource "azurerm_subnet" "A-subnet" {
  name                 = "Azure-tf-project-subnet"
  resource_group_name  = azurerm_resource_group.A-rg.name
  virtual_network_name = azurerm_virtual_network.A-vnet.name
  address_prefixes     = ["10.123.1.0/24"]
}

resource "azurerm_network_security_group" "A-sg" {
  name                = "Azure-tf-project-sg"
  resource_group_name = azurerm_resource_group.A-rg.name
  location            = azurerm_resource_group.A-rg.location
  tags = {
    environment = "test"
  }
}

module "network_security_rule" {
  source                      = "./modules/network_security_rule"
  rules                       = var.security_rules
  resource_group_name         = azurerm_resource_group.A-rg.name
  network_security_group_name = azurerm_network_security_group.A-sg.name
}

resource "azurerm_subnet_network_security_group_association" "A-sga" {
  subnet_id                 = azurerm_subnet.A-subnet.id
  network_security_group_id = azurerm_network_security_group.A-sg.id
}
