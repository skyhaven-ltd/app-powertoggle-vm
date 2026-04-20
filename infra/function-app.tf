resource "azurerm_service_plan" "plan" {
  name                = "asp-${local.resource_suffix}"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  os_type             = "Linux"
  sku_name            = "FC1"

  tags = local.tags
}

resource "azurerm_function_app_flex_consumption" "func" {
  name                = "func-${local.resource_suffix}"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  service_plan_id     = azurerm_service_plan.plan.id

  storage_container_type      = "blobContainer"
  storage_container_endpoint  = "${azurerm_storage_account.sa.primary_blob_endpoint}${azurerm_storage_container.files.name}"
  storage_authentication_type = "StorageAccountConnectionString"
  storage_access_key          = azurerm_storage_account.sa.primary_access_key

  runtime_name           = var.runtime_name
  runtime_version        = var.runtime_version
  maximum_instance_count = var.maximum_instance_count
  instance_memory_in_mb  = var.instance_memory_in_mb

  app_settings = local.function_app_app_settings

  identity {
    type = "SystemAssigned"
  }

  site_config {}

  tags = local.tags
}

resource "null_resource" "function_deploy" {
  count = var.function_zip_path != null ? 1 : 0

  triggers = {
    function_app_id = azurerm_function_app_flex_consumption.func.id
    zip_path        = var.function_zip_path
  }

  provisioner "local-exec" {
    command = <<-EOT
      set -euo pipefail

      az functionapp deployment source config-zip \
        --resource-group ${azurerm_resource_group.rg.name} \
        --name ${azurerm_function_app_flex_consumption.func.name} \
        --src ${var.function_zip_path}

      SUB_ID="$(az account show --query id -o tsv)"
      for i in $(seq 1 60); do
        if az rest --method get \
          --url "https://management.azure.com/subscriptions/$${SUB_ID}/resourceGroups/${azurerm_resource_group.rg.name}/providers/Microsoft.Web/sites/${azurerm_function_app_flex_consumption.func.name}/functions/${var.eventgrid_function_name}?api-version=2022-03-01" \
          >/dev/null 2>&1; then
          echo "Function ${var.eventgrid_function_name} is now visible in ARM"
          exit 0
        fi
        echo "Waiting for function to be visible... (attempt $i/60)"
        sleep 10
      done
      echo "Function not visible in ARM after 10 minutes"
      exit 1
    EOT
  }

  depends_on = [azurerm_function_app_flex_consumption.func]
}
