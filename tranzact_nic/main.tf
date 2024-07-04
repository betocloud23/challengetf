resource "azurerm_network_interface" "app3nic" {
  name                = "${var.prefix}-nic"
  location            = var.location
  resource_group_name = var.resource_group_name
  tags = {
    Owner = var.Owner
  }
  ip_configuration {
    name                          = "ip-01"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"
  }
}
