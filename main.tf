resource "google_cloud_run_service" "exam-pgr201-devops" {
  name = "e-copilot-296419"
  location = "us-central1"
  project = var.project_id

  template {
    spec {
      containers {
        image = "gcr.io/e-copilot-296419/exam-pgr201-devops@sha256:8903b3bbb8b0d910b30c96fb22cb39efc6a576f515235f3a6589290f0a03d2be"
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
  location = google_cloud_run_service.exam-pgr201-devops.location
  project = google_cloud_run_service.exam-pgr201-devops.project
  service = google_cloud_run_service.exam-pgr201-devops.name
  policy_data = data.google_iam_policy.noauth.policy_data
 }