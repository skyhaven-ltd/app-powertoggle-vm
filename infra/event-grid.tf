resource "azurerm_eventgrid_system_topic" "rm_subscription" {
  name                = "evst-${local.resource_suffix}"
  resource_group_name = azurerm_resource_group.rg.name

  source_resource_id = local.subscription_scope_id
  topic_type         = "Microsoft.Resources.Subscriptions"

  location = "Global"

  tags = local.tags
}

resource "azurerm_eventgrid_system_topic_event_subscription" "to_function" {
  count = var.enable_eventgrid_subscription ? 1 : 0

  name                = "evgs-${local.resource_suffix}"
  system_topic        = azurerm_eventgrid_system_topic.rm_subscription.name
  resource_group_name = azurerm_resource_group.rg.name

  included_event_types = var.eventgrid_included_event_types

  advanced_filter {
    string_contains {
      key    = "data.resourceUri"
      values = ["/providers/Microsoft.Compute/virtualMachines/"]
    }
  }

  azure_function_endpoint {
    function_id = "${azurerm_function_app_flex_consumption.func.id}/functions/${var.eventgrid_function_name}"
  }
}
