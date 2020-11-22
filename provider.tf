terraform {
  backend "gcs" {
    bucket = "exam-pgr301-bucket"
  prefix = "terraform-state"
  credentials = "terraform_keyfile.json"
  }
  }

provider "google-beta" {
credentials = file("terraform_keyfile.json")
project     = "dragonballz-296302"
version = "~> 3.0.0-beta.1"
}