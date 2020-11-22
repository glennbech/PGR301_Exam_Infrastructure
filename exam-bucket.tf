resource "google_storage_bucket" "static-site" {
  project = var.project_id
  #referring to stored variable.tf file
  name = "examstatepgr3301bucket"
  location = "US"
}