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
