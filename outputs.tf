output "analytics_hub_data_exchange_id" {
  value = try(google_bigquery_analytics_hub_data_exchange.this.*.id)
}

output "analytics_hub_data_exchange_name" {
  value = try(google_bigquery_analytics_hub_data_exchange.this.*.name)
}

output "analytics_hub_data_exchange_iam_member_id" {
  value = try(google_bigquery_analytics_hub_data_exchange_iam_member.this.*.id)
}

output "analytics_hub_listing_id" {
  value = try(google_bigquery_analytics_hub_listing.this.*.id)
}

output "analytics_hub_listing_name" {
  value = try(google_bigquery_analytics_hub_listing.this.*.name)
}

output "analytics_hub_listing_iam_member_id" {
  value = try(google_bigquery_analytics_hub_listing_iam_member.this.*.id)
}