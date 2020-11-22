#Saving terraform state to google cloud storage
terraform {
  backend "gcs" {
    bucket = "pgr301_exam_tf_state"
  prefix = "terraformstate"
  credentials = "terraform_keyfile.json"
  }
}

provider "google-beta" {
credentials = file("terraform_keyfile.json")
project     = "dragonballz-296302"
version = "~> 3.0.0-beta.1"
}