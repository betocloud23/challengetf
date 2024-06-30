output "name" {
  description = "The name of the Key Vault"
  value       = azurerm_key_vault.app3vault3.name
}

output "id" {
  description = "The ID of the Key Vault"
  value       = azurerm_key_vault.app3vault3.id
}

output "vault_uri" {
  description = "The URI of the Key Vault"
  value       = azurerm_key_vault.app3vault3.vault_uri
}
