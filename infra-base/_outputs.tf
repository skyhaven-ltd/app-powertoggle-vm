output "eventgrid_system_topic_name" {
  description = "Name of the Event Grid system topic."
  value       = azurerm_eventgrid_system_topic.rm_subscription.name
}

output "function_app_id" {
  description = "Resource ID of the deployed Function App."
  value       = azurerm_function_app_flex_consumption.func.id
}

output "function_app_name" {
  description = "Name of the deployed Function App."
  value       = azurerm_function_app_flex_consumption.func.name
}

output "resource_group_name" {
  description = "Name of the resource group."
  value       = azurerm_resource_group.rg.name
}
