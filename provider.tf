terraform {
  backend "gcs" {
    bucket = "exampgr301bucket"
    prefix = "terraformstate"
    credentials = "key-file.json"
  }
}

provider "google-beta" {
  credentials = file("key-file.json")
  project = "e-copilot-296419"
  version = "~> 3.0.0-beta.1"
}