variable "project_id" {
  type = string
}

provider "google" {
  credentials = file("gcp-service-account.json")

  project = var.project_id
  region  = "us-central1"
  zone    = "us-central1-c"
}

resource "google_compute_network" "vpc_network" {
  name = "terraform-network"
}
