resource "google_cloud_run_service" "dbzexampgr301" {
  name = "dbzexampgr301"
  location = "us-central1"
  project = var.project_id

  template {
    spec {
      containers {
        image = "gcr.io/dbzexampgr301/dbzexampgr301@sha256:c5b3a1a207f65a009a5f11cc6825c673d0dcd271042c73e4f46ed332c3bfe54e"
        env {
          name = "LOGZ_TOKEN"
          #referring to stored variable.tf file
          value = var.logz_token
        }
        env {
          name = "LOGZ_URL"
          value = var.logz_url
        }
        resources {
          limits = {
            memory = "512Mi"
          }
        }
      }
    }
  }
  traffic {
    percent = 100
    latest_revision = true
  }
}

data "google_iam_policy" "noauth" {
  binding{
    role = "roles/run.invoker"
    members = [
      "allUsers",
    ]
  }
}

resource "google_cloud_run_service_iam_policy" "noauth" {
  location = google_cloud_run_service.dbzexampgr301.location
  project = google_cloud_run_service.dbzexampgr301.project
  service = google_cloud_run_service.dbzexampgr301.name
  policy_data = data.google_iam_policy.noauth.policy_data
 }

output "url" {
  value = google_cloud_run_service.dbzexampgr301.status[0].url
}