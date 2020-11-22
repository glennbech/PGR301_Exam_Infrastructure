resource "google_cloud_run_service" "dragonballz" {
  name = "dragonballz-296302"
location = "us"
project = var.project_id #referring to stored variable.tf file

template {
  spec {
    containers {
      image = "gcr.io/dragonballz-296302/dragonballz@sha256:4231c34b1372e1042ca38b819b2a2776f97f34b81c1c0b0c70edad73ca26d856"
      env {
name = "LOGZ_TOKEN" #referring to stored variable.tf file
value = var.logz_token
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
binding {
role = "roles/run.invoker"
members = [
"allUsers",
]
  }
}

resource "google_cloud_run_service_iam_policy" "noauth" {
location = google_cloud_run_service.dragonballz.location
project = google_cloud_run_service.dragonballz.project
service = google_cloud_run_service.dragonballz.name
policy_data = data.google_iam_policy.noauth.policy_data
}