resource "azurerm_key_vault" "app3vault3" {
  name                     = "${var.prefix}-keyvault"
  resource_group_name      = var.resource_group_name
  location                 = var.location
  tenant_id                = var.tenant_id
  purge_protection_enabled = true
  sku_name                 = "standard"
  access_policy {
    tenant_id = var.tenant_id
    object_id = var.client_id

    secret_permissions = ["Get", "List", "Set", "Delete", "Recover"]
    key_permissions    = ["Get", "List", "Update", "Create", "Delete", "Recover"]
  }
  network_acls {
    default_action = "Deny"
    bypass         = "AzureServices"

    ip_rules = [var.allowed_ip_address]

    virtual_network_subnet_ids = [var.subnet_id]
  }
  tags = {
    Owner = var.Owner
  }
}
