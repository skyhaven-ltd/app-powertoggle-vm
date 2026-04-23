resource "azurerm_eventgrid_system_topic" "rm_subscription" {
  name                = "egst-${local.resource_suffix}"
  resource_group_name = azurerm_resource_group.rg.name

  source_resource_id = local.subscription_scope_id
  topic_type         = "Microsoft.Resources.Subscriptions"

  location = "Global"

  tags = local.tags
}
