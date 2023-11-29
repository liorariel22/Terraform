# Networking configuration
resource_group_name = "Azure-tf-project-rg"
region          = "eastus"

# VM 
host_os         = "linux"
vm_username     = "adminuser"

# Security Rules Configuration - MAP
security_rules = {
  "rule1" = {
    priority                    = 100
    direction                   = "Inbound"
    access                      = "Allow"
    protocol                    = "Tcp"
    source_port_range           = "*"
    destination_port_range      = "*"
    source_address_prefix       = "*"
    destination_address_prefix  = "*"
  },
  "rule2" = {
    priority                    = 110
    direction                   = "Inbound"
    access                      = "Deny"
    protocol                    = "Tcp"
    source_port_range           = "*"
    destination_port_range      = "1234"
    source_address_prefix       = "*"
    destination_address_prefix  = "*"
  }
}