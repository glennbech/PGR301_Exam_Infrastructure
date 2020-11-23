resource "google_cloud_run_service" "dbzexampgr301" {
  name = "dbzexampgr301"
  location = "us-central1"
  project = var.project_id

  template {
    spec {
      containers {
        image = "gcr.io/dbzexampgr301/dbzexampgr301@sha256:a60186936528a372f04ffa40af21f63968b9a6f0f571e4bf059700d385afa5b5"
        env {
          name = "LOGZ_TOKEN"
          #referring to stored variable.tf file
          value = var.logz_token
        }
        env {
          name = "LOGZ_URL"
          value = var.logz_url
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