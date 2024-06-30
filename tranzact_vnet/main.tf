resource "azurerm_virtual_network" "app3main" {
  name                = "${var.prefix}-vnet"
  address_space       = var.vnetcidr
  location            = var.location
  resource_group_name = var.resource_group_name
  tags = {
    Owner = var.Owner
  }
}
