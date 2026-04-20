resource "azurerm_storage_account" "sa" {
  name                     = "st${local.resource_suffix_flat}"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = var.storage_replication_type

  tags = local.tags
}

resource "azurerm_storage_container" "files" {
  name                  = "function-files"
  storage_account_id    = azurerm_storage_account.sa.id
  container_access_type = "private"
}

resource "azurerm_storage_table" "tables" {
  for_each             = local.storage_table_names
  name                 = each.value
  storage_account_name = azurerm_storage_account.sa.name
}
