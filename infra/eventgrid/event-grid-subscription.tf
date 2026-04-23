resource "azurerm_eventgrid_system_topic_event_subscription" "to_function" {
  name                = local.subscription_name
  system_topic        = local.system_topic_name
  resource_group_name = local.resource_group_name

  included_event_types = var.eventgrid_included_event_types

  advanced_filter {
    string_contains {
      key    = "data.resourceUri"
      values = ["/providers/Microsoft.Compute/virtualMachines/"]
    }
  }

  azure_function_endpoint {
    function_id = "${local.function_app_id}/functions/${var.eventgrid_function_name}"
  }
}
