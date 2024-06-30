resource "azurerm_network_security_group" "app3nsg" {
  name                = "${var.prefix}-nsg"
  location            = var.location
  resource_group_name = var.resource_group_name
  tags = {
    Owner = var.Owner
  }
  security_rule {
    name                       = "AllowSSH"
    priority                   = 1001
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "443"
    source_address_prefix      = "10.12.1.0/24"
    destination_address_prefix = "*"
  }
}
