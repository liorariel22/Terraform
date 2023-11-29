variable "rules" {
  description = "Map of network security rules"
  type = map(object({
    priority                    = number
    direction                   = string
    access                      = string
    protocol                    = string
    source_port_range           = string
    destination_port_range      = string
    source_address_prefix       = string
    destination_address_prefix  = string
  }))
}

variable "resource_group_name" {
  description = "Resource group name the network security rule belongs to"
  type        = string
}

variable "network_security_group_name" {
  description = "Network security group name the rule belongs to"
  type        = string
}
