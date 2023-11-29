variable "rule_name" {
  description = "Name of the network security rule"
  type        = string
}

variable "priority" {
  description = "Priority of the network security rule"
  type        = number
}

variable "direction" {
  description = "Direction of the network security rule (Inbound or Outbound)"
  type        = string
}

variable "access" {
  description = "Specifies whether network traffic is allowed or denied"
  type        = string
}

variable "protocol" {
  description = "Network protocol this rule applies to"
  type        = string
}

variable "source_port_range" {
  description = "Source port or range"
  type        = string
}

variable "destination_port_range" {
  description = "Destination port or range"
  type        = string
}

variable "source_address_prefix" {
  description = "Source address prefix. CIDR or source IP range."
  type        = string
}

variable "destination_address_prefix" {
  description = "Destination address prefix. CIDR or destination IP range."
  type        = string
}

variable "resource_group_name" {
  description = "Resource group name the network security rule belongs to"
  type        = string
}

variable "network_security_group_name" {
  description = "Network security group name the rule belongs to"
  type        = string
}
