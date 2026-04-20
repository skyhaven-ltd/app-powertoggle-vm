locals {
  resource_suffix = "${var.workload}-${var.environment}-${var.location_short}-${var.instance}"

  resource_group_name = "rg-${local.resource_suffix}"
  function_app_name   = "func-${local.resource_suffix}"
  function_app_id     = "/subscriptions/${data.azurerm_client_config.current.subscription_id}/resourceGroups/${local.resource_group_name}/providers/Microsoft.Web/sites/${local.function_app_name}"
  subscription_name   = "evgs-${local.resource_suffix}"
  system_topic_name   = "evst-${local.resource_suffix}"
}
