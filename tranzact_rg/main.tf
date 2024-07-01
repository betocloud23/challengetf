resource "azurerm_resource_group" "app3tranzact" {
  name     = "${var.prefix}-rg"
  location = var.location
  tags = {
    Owner = var.Owner
  }
}
