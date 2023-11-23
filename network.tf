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

resource "azurerm_network_security_rule" "A-test-rule" {
  name                        = "Azure-tf-project-test-rule"
  priority                    = 100
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "*"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_resource_group.A-rg.name
  network_security_group_name = azurerm_network_security_group.A-sg.name
}

resource "azurerm_subnet_network_security_group_association" "A-sga" {
  subnet_id                 = azurerm_subnet.A-subnet.id
  network_security_group_id = azurerm_network_security_group.A-sg.id
}
