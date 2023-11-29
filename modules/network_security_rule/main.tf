resource "azurerm_network_security_rule" "nsg_rule" {
  count                       = length(var.rules)
  name                        = var.rules[count.index].rule_name
  priority                    = var.rules[count.index].priority
  direction                   = var.rules[count.index].direction
  access                      = var.rules[count.index].access
  protocol                    = var.rules[count.index].protocol
  source_port_range           = var.rules[count.index].source_port_range
  destination_port_range      = var.rules[count.index].destination_port_range
  source_address_prefix       = var.rules[count.index].source_address_prefix
  destination_address_prefix  = var.rules[count.index].destination_address_prefix
  resource_group_name         = var.resource_group_name
  network_security_group_name = var.network_security_group_name
}
