resource "google_storage_bucket" "static-site" {
  project = var.project_id #referring to stored variable.tf file
  name = "pgr301_exam_tf_state"
location = "us"
}