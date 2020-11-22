terraform {
  backend "gcs" {
    bucket = "exampgr301bucket"
    prefix = "terraformstate"
    credentials = "terraform-key.json"
  }
}

provider "google-beta" {
  credentials = file("terraform-key.json")
  project = "e-copilot-296419"
  version = "~> 3.0.0-beta.1"
}