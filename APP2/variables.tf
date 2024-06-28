variable "prefix" {

}
variable "location" {

}
variable "Owner" {

}

variable "account_tier" {

}
variable "account_replication_type" {

}
variable "subnet_cidr" {

}
variable "allowed_ip_address" {

}
variable "tenant_id" {

}
variable "client_id" {

  sensitive = true
}

variable "vnetcidr" {
  type = list(string)

}
