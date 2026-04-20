output "eventgrid_subscription_name" {
  description = "Name of the Event Grid subscription."
  value       = azurerm_eventgrid_system_topic_event_subscription.to_function.name
}
