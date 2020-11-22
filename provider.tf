terraform {
  backend "gcs" {
    bucket = "exampgr301bucket"
    prefix = "terraformstate"
    credentials = "key-file.json"
  }
}

provider "google-beta" {
  version = "3.5.0"
  credentials = file("key-file.json")
  project = "e-copilot-296419"
}