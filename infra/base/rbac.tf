resource "azurerm_role_assignment" "func_vm_contributor_sub" {
  scope                = local.subscription_scope_id
  role_definition_name = "Virtual Machine Contributor"
  principal_id         = azurerm_function_app_flex_consumption.func.identity[0].principal_id
}

resource "azurerm_role_assignment" "func_table_contributor_sa" {
  scope                = azurerm_storage_account.sa.id
  role_definition_name = "Storage Table Data Contributor"
  principal_id         = azurerm_function_app_flex_consumption.func.identity[0].principal_id
}
