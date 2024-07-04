resource "azurerm_storage_account" "app3stga" {
  name                     = "${var.prefix}sa99"
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = var.account_tier
  account_replication_type = var.account_replication_type

  network_rules {
    default_action             = "Deny"
    ip_rules                   = [var.allowed_ip_address]
    virtual_network_subnet_ids = [var.subnet_id]
  }

  tags = {
    Owner = var.Owner
  }
}
resource "azurerm_storage_container" "app3cont" {
  name                  = "container01"
  storage_account_name  = azurerm_storage_account.app3stga.name
  container_access_type = "private"
}
