provider "statuscake" {
  username = var.statuscake_user
  apikey = var.statuscake_key
}

resource "statuscake_test" "googlecloudruntest" {
  website_name = "My test"
  website_url  = "${google_cloud_run_service.dbzexampgr301.status[0].url}/dragonballz/characters"
  test_type    = "HTTP"
  check_rate   = 300
  contact_group = ["195590"]
}

terraform {
  required_providers {
    statuscake = {
      source = "terraform-providers/statuscake"
    }
  }
}