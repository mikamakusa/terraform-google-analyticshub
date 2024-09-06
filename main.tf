resource "google_bigquery_analytics_hub_data_exchange" "this" {
  count            = length(var.analytics_hub_data_exchange)
  data_exchange_id = lookup(var.analytics_hub_data_exchange[count.index], "data_exchange_id")
  display_name     = lookup(var.analytics_hub_data_exchange[count.index], "display_name")
  location         = lookup(var.analytics_hub_data_exchange[count.index], "location")
  description      = lookup(var.analytics_hub_data_exchange[count.index], "description")
  primary_contact  = lookup(var.analytics_hub_data_exchange[count.index], "primary_contact")
  documentation    = lookup(var.analytics_hub_data_exchange[count.index], "documentation")
  icon             = lookup(var.analytics_hub_data_exchange[count.index], "icon")
  project          = data.google_project.this.id
}

resource "google_bigquery_analytics_hub_data_exchange_iam_member" "this" {
  count            = length(var.analytics_hub_data_exchange) == 0 ? 0 : length(var.analytics_hub_data_exchange_iam_member)
  data_exchange_id = try(element(google_bigquery_analytics_hub_data_exchange.this.*.id, lookup(var.analytics_hub_data_exchange_iam_member[count.index], "data_exchange_id")))
  member           = lookup(var.analytics_hub_data_exchange_iam_member[count.index], "member")
  role             = lookup(var.analytics_hub_data_exchange_iam_member[count.index], "role")
  project          = data.google_project.this.id
  location         = lookup(var.analytics_hub_data_exchange_iam_member[count.index], "location")
}

resource "google_bigquery_analytics_hub_listing" "this" {
  count            = length(var.dataset) == 0 ? 0 : length(var.analytics_hub_listing)
  data_exchange_id = try(element(google_bigquery_analytics_hub_data_exchange.this.*.id, lookup(var.analytics_hub_listing[count.index], "data_exchange_id")))
  display_name     = lookup(var.analytics_hub_listing[count.index], "display_name")
  listing_id       = lookup(var.analytics_hub_listing[count.index], "listing_id")
  location         = lookup(var.analytics_hub_listing[count.index], "location")

  dynamic "bigquery_dataset" {
    for_each = lookup(var.analytics_hub_listing[count.index], "bigquery_dataset")
    iterator = bq
    content {
      dataset = try(element(module.bigquery.*.dataset_id, lookup(bq.value, "dataset_id")))
    }
  }

  dynamic "data_provider" {
    for_each = try(lookup(var.analytics_hub_listing[count.index], "data_provider") == null ? [] : ["data_provider"])
    iterator = dat
    content {
      name            = lookup(dat.value, "name")
      primary_contact = lookup(dat.value, "primary_contact")
    }
  }

  dynamic "publisher" {
    for_each = try(lookup(var.analytics_hub_listing[count.index], "publisher") == null ? [] : ["publisher"])
    iterator = pub
    content {
      name            = lookup(pub.value, "name")
      primary_contact = lookup(pub.value, "primary_contact")
    }
  }

  dynamic "restricted_export_config" {
    for_each = try(lookup(var.analytics_hub_listing[count.index], "restricted_export_config") == null ? [] : ["restricted_export_config"])
    iterator = res
    content {
      enabled                      = lookup(res.value, "enabled")
      restrict_query_result        = lookup(res.value, "restrict_query_result")
      restrict_direct_table_access = lookup(res.value, "restrict_direct_table_access")
    }
  }
}

resource "google_bigquery_analytics_hub_listing_iam_member" "this" {
  count            = (length(var.analytics_hub_listing) && length(var.analytics_hub_data_exchange)) == 0 ? 0 : length(var.analytics_hub_listing_iam_member)
  data_exchange_id = try(element(google_bigquery_analytics_hub_data_exchange.this.*.id, lookup(var.analytics_hub_listing_iam_member[count.index], "data_exchange_id")))
  listing_id       = try(element(google_bigquery_analytics_hub_listing.this.*.id, lookup(var.analytics_hub_listing_iam_member[count.index], "listing_id")))
  member           = lookup(var.analytics_hub_listing_iam_member[count.index], "member")
  role             = lookup(var.analytics_hub_listing_iam_member[count.index], "role")
  location         = lookup(var.analytics_hub_listing_iam_member[count.index], "location")
  project          = data.google_project.this.id
}