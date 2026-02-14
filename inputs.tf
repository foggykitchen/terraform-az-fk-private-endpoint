variable "name" {
  description = "Base name for the Private Endpoint."
  type        = string
}

variable "location" {
  description = "Azure region."
  type        = string
}

variable "resource_group_name" {
  description = "Resource group name."
  type        = string
}

variable "subnet_id" {
  description = "Subnet ID where the Private Endpoint NIC will be placed."
  type        = string
}

variable "private_connection_resource_id" {
  description = "Resource ID of the target service (e.g. Storage Account, Key Vault, ACR, etc.)."
  type        = string
}

variable "subresource_names" {
  description = "Subresource names for the Private Service Connection (e.g. ['blob'], ['file'], ['vault'], ['registry'])."
  type        = list(string)
}

variable "is_manual_connection" {
  description = "Whether the private endpoint connection requires manual approval."
  type        = bool
  default     = false
}

variable "request_message" {
  description = "Optional request message (used mainly for manual approval flows)."
  type        = string
  default     = null
}

variable "private_ip_address" {
  description = "Optional static private IP address for the Private Endpoint NIC. Null means dynamic allocation."
  type        = string
  default     = null
}

variable "private_ip_name" {
  description = "Name for the private IP configuration when static IP is used."
  type        = string
  default     = "pe-ipcfg"
}

variable "private_dns_zone_group_name" {
  description = "Name of the Private DNS Zone Group (when private_dns_zone_ids is provided)."
  type        = string
  default     = "default"
}

variable "private_dns_zone_ids" {
  description = "Optional list of Private DNS Zone IDs to link via Private DNS Zone Group (e.g. privatelink.blob.core.windows.net)."
  type        = list(string)
  default     = []
}

variable "tags" {
  description = "Resource tags."
  type        = map(string)
  default     = {}
}

