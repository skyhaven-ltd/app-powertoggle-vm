output "function_app_name" {
  description = "Name of the deployed Function App."
  value       = azurerm_function_app_flex_consumption.func.name
}

output "resource_group_name" {
  description = "Name of the resource group."
  value       = azurerm_resource_group.rg.name
}
