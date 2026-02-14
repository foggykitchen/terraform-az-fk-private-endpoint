output "private_endpoint_id" {
  description = "ID of the Private Endpoint."
  value       = azurerm_private_endpoint.this.id
}

output "private_endpoint_name" {
  description = "Name of the Private Endpoint."
  value       = azurerm_private_endpoint.this.name
}

output "network_interface_ids" {
  description = "List of NIC IDs created for the Private Endpoint."
  value       = azurerm_private_endpoint.this.network_interface
}

output "private_service_connection_name" {
  description = "Name of the Private Service Connection."
  value       = azurerm_private_endpoint.this.private_service_connection[0].name
}

output "private_dns_zone_group_name" {
  description = "Name of the Private DNS Zone Group (if configured)."
  value       = length(var.private_dns_zone_ids) > 0 ? var.private_dns_zone_group_name : null
}

output "custom_dns_configs" {
  description = "DNS configurations returned by Azure for the Private Endpoint."
  value       = azurerm_private_endpoint.this.custom_dns_configs
}

output "private_ip_addresses" {
  description = "Private IP addresses assigned to the Private Endpoint."
  value       = flatten([for cfg in azurerm_private_endpoint.this.custom_dns_configs : cfg.ip_addresses])
}
