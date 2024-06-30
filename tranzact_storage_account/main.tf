resource "azurerm_storage_account" "app3stga" {
  name                     = "${var.prefix}st499"
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
