variable "prefix" {
  description = "Prefix for naming resources"
}

variable "resource_group_name" {
  description = "The name of the resource group"
}

variable "location" {
  description = "The location where resources will be created"
}

variable "account_tier" {
  description = "The tier of the storage account"
}

variable "account_replication_type" {
  description = "The replication type of the storage account"
}

variable "allowed_ip_address" {
  description = "IP address allowed to access the storage account"
}

variable "subnet_id" {
  description = "The ID of the subnet"
}

variable "Owner" {
  description = "Owner tag for resources"
}
