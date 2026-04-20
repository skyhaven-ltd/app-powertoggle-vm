variable "workload" {
  description = "Workload name used in resource naming."
  type        = string
  default     = "powertoggle"
}

variable "environment" {
  description = "Environment token (dev, uat, prd)."
  type        = string
}

variable "location" {
  description = "Azure region."
  type        = string
  default     = "uksouth"
}

variable "location_short" {
  description = "Short region token used in resource naming (e.g. uks)."
  type        = string
  default     = "uks"
}

variable "instance" {
  description = "Instance index used in resource naming (e.g. 01)."
  type        = string
  default     = "01"
}

variable "storage_replication_type" {
  description = "Storage replication type (e.g., LRS, GRS, ZRS)."
  type        = string
  default     = "LRS"
}

variable "runtime_name" {
  description = "Flex runtime name: dotnet-isolated, java, node, powershell, python."
  type        = string
  default     = "node"
}

variable "runtime_version" {
  description = "Flex runtime version (stack-specific)."
  type        = string
  default     = "22"
}

variable "maximum_instance_count" {
  description = "Max scale-out instance count."
  type        = number
  default     = 50
}

variable "instance_memory_in_mb" {
  description = "Instance memory size in MB."
  type        = number
  default     = 2048
}

variable "default_tz" {
  type = string
}

variable "horizon_days" {
  type = string
}

variable "allow_drift_minutes" {
  type = string
}

variable "eventgrid_included_event_types" {
  description = "Optional list of included event types."
  type        = list(string)
  default     = ["Microsoft.Resources.ResourceWriteSuccess"]
}

variable "eventgrid_function_name" {
  description = "Azure Function name (the function inside the app) that has the EventGridTrigger."
  type        = string
  default     = "TagIngest"
}

variable "function_zip_path" {
  description = "Local path to the function app zip package. When set, code is deployed and the Event Grid subscription is created."
  type        = string
  default     = null
}
