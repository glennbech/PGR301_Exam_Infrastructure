resource "google_storage_bucket" "static-site" {
  project = var.project_id #referring to stored variable.tf file
  name = "exam-pgr301-bucket"
location = "US"
}