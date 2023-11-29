variable "rules" {
  type = list(object({
    rule_name                   = string
    priority                    = number
    direction                   = string
    access                      = string
    protocol                    = string
    source_port_range           = string
    destination_port_range      = string
    source_address_prefix       = string
    destination_address_prefix  = string
  }))
  description = "List of network security rules"
}

variable "resource_group_name" {
  description = "Resource group name the network security rule belongs to"
  type        = string
}

variable "network_security_group_name" {
  description = "Network security group name the rule belongs to"
  type        = string
}
