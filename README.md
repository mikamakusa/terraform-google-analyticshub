## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_google"></a> [google](#requirement\_google) | 6.1.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | 6.1.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_bigquery"></a> [bigquery](#module\_bigquery) | ./modules/terraform-google-bigquery | n/a |

## Resources

| Name | Type |
|------|------|
| [google_bigquery_analytics_hub_data_exchange.this](https://registry.terraform.io/providers/hashicorp/google/6.1.0/docs/resources/bigquery_analytics_hub_data_exchange) | resource |
| [google_bigquery_analytics_hub_data_exchange_iam_member.this](https://registry.terraform.io/providers/hashicorp/google/6.1.0/docs/resources/bigquery_analytics_hub_data_exchange_iam_member) | resource |
| [google_bigquery_analytics_hub_listing.this](https://registry.terraform.io/providers/hashicorp/google/6.1.0/docs/resources/bigquery_analytics_hub_listing) | resource |
| [google_bigquery_analytics_hub_listing_iam_member.this](https://registry.terraform.io/providers/hashicorp/google/6.1.0/docs/resources/bigquery_analytics_hub_listing_iam_member) | resource |
| [google_project.this](https://registry.terraform.io/providers/hashicorp/google/6.1.0/docs/data-sources/project) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_analytics_hub_data_exchange"></a> [analytics\_hub\_data\_exchange](#input\_analytics\_hub\_data\_exchange) | n/a | <pre>list(object({<br>    id               = number<br>    data_exchange_id = string<br>    display_name     = string<br>    location         = string<br>    description      = optional(string)<br>    primary_contact  = optional(string)<br>    documentation    = optional(string)<br>    icon             = optional(string)<br>  }))</pre> | `[]` | no |
| <a name="input_analytics_hub_data_exchange_iam_member"></a> [analytics\_hub\_data\_exchange\_iam\_member](#input\_analytics\_hub\_data\_exchange\_iam\_member) | n/a | <pre>list(object({<br>    id               = number<br>    data_exchange_id = any<br>    member           = string<br>    role             = string<br>    location         = optional(string)<br>  }))</pre> | `[]` | no |
| <a name="input_analytics_hub_listing"></a> [analytics\_hub\_listing](#input\_analytics\_hub\_listing) | n/a | <pre>list(object({<br>    id               = number<br>    data_exchange_id = any<br>    display_name     = string<br>    listing_id       = string<br>    location         = string<br>    bigquery_dataset = list(object({<br>      dataset_id = any<br>    }))<br>    data_provider = optional(list(object({<br>      name            = string<br>      primary_contact = optional(string)<br>    })))<br>    publisher = optional(list(object({<br>      name            = string<br>      primary_contact = optional(string)<br>    })))<br>    restricted_export_config = optional(list(object({<br>      enabled                      = optional(bool)<br>      restrict_query_result        = optional(bool)<br>      restrict_direct_table_access = optional(bool)<br>    })))<br>  }))</pre> | `[]` | no |
| <a name="input_analytics_hub_listing_iam_member"></a> [analytics\_hub\_listing\_iam\_member](#input\_analytics\_hub\_listing\_iam\_member) | n/a | <pre>list(object({<br>    id               = number<br>    data_exchange_id = any<br>    listing_id       = any<br>    member           = string<br>    role             = string<br>    location         = optional(string)<br>  }))</pre> | `[]` | no |
| <a name="input_dataset"></a> [dataset](#input\_dataset) | n/a | `any` | `[]` | no |
| <a name="input_table"></a> [table](#input\_table) | n/a | `any` | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_analytics_hub_data_exchange_iam_member_id"></a> [analytics\_hub\_data\_exchange\_iam\_member\_id](#output\_analytics\_hub\_data\_exchange\_iam\_member\_id) | n/a |
| <a name="output_analytics_hub_data_exchange_id"></a> [analytics\_hub\_data\_exchange\_id](#output\_analytics\_hub\_data\_exchange\_id) | n/a |
| <a name="output_analytics_hub_data_exchange_name"></a> [analytics\_hub\_data\_exchange\_name](#output\_analytics\_hub\_data\_exchange\_name) | n/a |
| <a name="output_analytics_hub_listing_iam_member_id"></a> [analytics\_hub\_listing\_iam\_member\_id](#output\_analytics\_hub\_listing\_iam\_member\_id) | n/a |
| <a name="output_analytics_hub_listing_id"></a> [analytics\_hub\_listing\_id](#output\_analytics\_hub\_listing\_id) | n/a |
| <a name="output_analytics_hub_listing_name"></a> [analytics\_hub\_listing\_name](#output\_analytics\_hub\_listing\_name) | n/a |
