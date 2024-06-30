resource "azurerm_subnet" "app3internal" {
  name                 = "internal"
  resource_group_name  = var.resource_group_name
  virtual_network_name = var.virtual_network_name
  address_prefixes     = var.subnet_cidr

  service_endpoints = [
    "Microsoft.Storage",
    "Microsoft.KeyVault",
  ]
}
