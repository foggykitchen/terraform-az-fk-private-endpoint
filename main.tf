locals {
  use_static_ip = var.private_ip_address != null && var.private_ip_address != ""
}

resource "azurerm_private_endpoint" "this" {
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group_name
  subnet_id           = var.subnet_id

  private_service_connection {
    name                           = "${var.name}-psc"
    private_connection_resource_id = var.private_connection_resource_id
    subresource_names              = var.subresource_names
    is_manual_connection           = var.is_manual_connection
    request_message                = var.request_message
  }

  dynamic "private_dns_zone_group" {
    for_each = length(var.private_dns_zone_ids) > 0 ? [1] : []
    content {
      name                 = var.private_dns_zone_group_name
      private_dns_zone_ids = var.private_dns_zone_ids
    }
  }

  dynamic "ip_configuration" {
    for_each = local.use_static_ip ? [1] : []
    content {
      name               = var.private_ip_name
      private_ip_address = var.private_ip_address
      subresource_name   = var.subresource_names[0]
      member_name        = var.subresource_names[0]
    }
  }

  tags = var.tags
}
