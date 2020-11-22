resource "google_cloud_run_service" "exam-pgr201-devops" {
  name = "e-copilot-296419"
  location = "us-central1"
  project = var.project_id

  template {
    spec {
      containers {
        image = "gcr.io/e-copilot-296419/exam-pgr201-devops@sha256:479de57f99dbde551dd47ff08eba5157cc059ae854d8d5f50d8b3a94eca42613"
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