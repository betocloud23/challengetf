variable "prefix" {
  description = "Prefix for naming resources"
}

variable "location" {
  description = "The location where resources will be created"
}

variable "Owner" {
  description = "Owner tag for resources"
}

variable "account_tier" {
  description = "The tier of the storage account"
}

variable "account_replication_type" {
  description = "The replication type of the storage account"
}

variable "subnet_cidr" {
  description = "CIDR block for the subnet"
  type        = list(string)
}

variable "allowed_ip_address" {
  description = "IP address allowed to access the Key Vault"
}

variable "tenant_id" {
  description = "The tenant ID for Azure"
}

variable "client_id" {
  description = "The client ID for access policy"
  sensitive   = true
}

variable "vnetcidr" {
  description = "CIDR block for the virtual network"
  type        = list(string)
}
