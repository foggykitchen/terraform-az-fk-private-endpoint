module "private_endpoint_blob" {
  source = "../../"

  name                = local.pe_name
  location            = azurerm_resource_group.foggykitchen_rg.location
  resource_group_name = azurerm_resource_group.foggykitchen_rg.name
  subnet_id           = module.vnet.subnet_ids["fk-subnet-private-endpoints"]

  private_connection_resource_id = module.storage.storage_account_id
  subresource_names              = ["blob"]
  is_manual_connection           = false

  private_dns_zone_group_name = "default"
  private_dns_zone_ids        = [azurerm_private_dns_zone.fk_blob_dns_zone.id]

  tags = var.tags
}
