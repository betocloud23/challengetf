### CREAR RG  ###
resource "azurerm_resource_group" "tranzact" {
  name     = "${var.prefix}-rg"
  location = var.location
  tags = {
    Owner = var.Owner
  }

}
### CREAR Vnet  ###
resource "azurerm_virtual_network" "main" {
  name                = "${var.prefix}-vnet"
  address_space       = var.vnetcidr
  location            = azurerm_resource_group.tranzact.location
  resource_group_name = azurerm_resource_group.tranzact.name
  tags = {
    Owner = var.Owner
  }
}
### CREAR Subnet  ###
resource "azurerm_subnet" "internal" {
  name                 = "internal"
  resource_group_name  = azurerm_resource_group.tranzact.name
  virtual_network_name = azurerm_virtual_network.main.name
  address_prefixes     = var.subnet_cidr

  service_endpoints = [
    "Microsoft.Storage",
    "Microsoft.KeyVault",
  ]
}




### CREAR NIC ###
resource "azurerm_network_interface" "main" {
  name                = "${var.prefix}-nic"
  location            = azurerm_resource_group.tranzact.location
  resource_group_name = azurerm_resource_group.tranzact.name
  tags = {
    Owner = var.Owner
  }
  ip_configuration {
    name                          = "ip-01"
    subnet_id                     = azurerm_subnet.internal.id
    private_ip_address_allocation = "Dynamic"

  }

}


### CREAR NSG  ###
resource "azurerm_network_security_group" "nsg" {
  name                = "${var.prefix}-nsg"
  location            = azurerm_resource_group.tranzact.location
  resource_group_name = azurerm_resource_group.tranzact.name
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
## Attach NSG to Subnet##
resource "azurerm_subnet_network_security_group_association" "nsg" {
  subnet_id                 = azurerm_subnet.internal.id
  network_security_group_id = azurerm_network_security_group.nsg.id
}
## Create KeyVault ##
resource "azurerm_key_vault" "vault" {
  name                     = "${var.prefix}-keyvault"
  resource_group_name      = azurerm_resource_group.tranzact.name
  location                 = azurerm_resource_group.tranzact.location
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

    virtual_network_subnet_ids = [azurerm_subnet.internal.id]
  }
  tags = {
    Owner = var.Owner
  }
}
##Create Storage Account##
resource "azurerm_storage_account" "stga" {
  name                     = "${var.prefix}st499"
  resource_group_name      = azurerm_resource_group.tranzact.name
  location                 = azurerm_resource_group.tranzact.location
  account_tier             = var.account_tier
  account_replication_type = var.account_replication_type

  network_rules {
    default_action             = "Deny"
    ip_rules                   = ["170.246.58.126"]
    virtual_network_subnet_ids = [azurerm_subnet.internal.id]
  }

  tags = {
    Owner = var.Owner
  }
}
