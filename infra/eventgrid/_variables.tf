variable "workload" {
  description = "Workload name used in resource naming."
  type        = string
  default     = "powertoggle"
}

variable "environment" {
  description = "Environment token (dev, uat, prd)."
  type        = string
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
