locals {
  resource_suffix      = "${var.workload}-${var.environment}-${var.location_short}-${var.instance}"
  resource_suffix_flat = "${var.workload}${var.environment}${var.location_short}${var.instance}"

  subscription_scope_id = "/subscriptions/${data.azurerm_client_config.current.subscription_id}"

  storage_table_names = toset(["VmSchedules", "DueIndex"])

  tables_url = "https://${azurerm_storage_account.sa.name}.table.core.windows.net"

  function_app_app_settings = {
    TABLES_URL          = local.tables_url
    DEFAULT_TZ          = var.default_tz
    HORIZON_DAYS        = var.horizon_days
    ALLOW_DRIFT_MINUTES = var.allow_drift_minutes
  }

  tags = {
    managed-by = "terraform"
  }
}
