module "bigquery" {
  source     = "./modules/terraform-google-bigquery"
  project_id = data.google_project.this.id
  dataset    = var.dataset
  table      = var.table
}