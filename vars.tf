## MODULES

variable "dataset" {
  type    = any
  default = []
}

variable "table" {
  type    = any
  default = []
}

## RESOURCES

variable "analytics_hub_data_exchange" {
  type = list(object({
    id               = number
    data_exchange_id = string
    display_name     = string
    location         = string
    description      = optional(string)
    primary_contact  = optional(string)
    documentation    = optional(string)
    icon             = optional(string)
  }))
  default = []
}

variable "analytics_hub_data_exchange_iam_member" {
  type = list(object({
    id               = number
    data_exchange_id = any
    member           = string
    role             = string
    location         = optional(string)
  }))
  default = []
}

variable "analytics_hub_listing" {
  type = list(object({
    id               = number
    data_exchange_id = any
    display_name     = string
    listing_id       = string
    location         = string
    bigquery_dataset = list(object({
      dataset_id = any
    }))
    data_provider = optional(list(object({
      name            = string
      primary_contact = optional(string)
    })))
    publisher = optional(list(object({
      name            = string
      primary_contact = optional(string)
    })))
    restricted_export_config = optional(list(object({
      enabled                      = optional(bool)
      restrict_query_result        = optional(bool)
      restrict_direct_table_access = optional(bool)
    })))
  }))
  default = []
}

variable "analytics_hub_listing_iam_member" {
  type = list(object({
    id               = number
    data_exchange_id = any
    listing_id       = any
    member           = string
    role             = string
    location         = optional(string)
  }))
  default = []
}
