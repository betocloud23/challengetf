output "name" {
  description = "The name of the Key Vault"
  value       = azurerm_key_vault.app3vault.name
}

output "id" {
  description = "The ID of the Key Vault"
  value       = azurerm_key_vault.app3vault.id
}

output "vault_uri" {
  description = "The URI of the Key Vault"
  value       = azurerm_key_vault.app3vault.vault_uri
}
