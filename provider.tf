terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
    }
  }
}

terraform {
  backend "gcs" {
    bucket = "bucketforexam"
    prefix = "terraformstate"
    credentials = "key-file.json"
  }
}

provider "google" {
  version = "3.5.0"
  credentials = file("key-file.json")
  project = "dbzexampgr301"
}
