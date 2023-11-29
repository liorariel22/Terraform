variable "host_os" {
  description = "Host operating system"
  type        = string
}

variable "resource_group_name" {
  description = "Resource group name for all module resources."
  type        = string
}

variable "region" {
  description = "Region for all module resources."
  type        = string
}

variable "vm_username" {
  description = "The Username of the VM."
  type        = string
}

variable "security_rules" {
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