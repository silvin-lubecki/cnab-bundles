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
  name = "cnab-network"
}

resource "google_compute_address" "vm_static_ip" {
  name = "cnab-static-ip"
}

resource "google_compute_instance" "vm_instance" {
  name         = "cnab-instance"
  machine_type = "f1-micro"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }

  network_interface {
    network = google_compute_network.vpc_network.name
    access_config {
        nat_ip = google_compute_address.vm_static_ip.address
    }
  }
}

output "ip" {
  value = google_compute_address.vm_static_ip.address
}