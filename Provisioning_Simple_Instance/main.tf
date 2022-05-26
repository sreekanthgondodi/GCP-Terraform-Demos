provider "google" {
    credentials = file("gcp-terraform-account.json")
    project     = "gcp-terraform-351406"
    region      = "asia-southeast1"
    zone        = "asia-southeast1-b"
}


resource "google_compute_instance" "default" {
  name         = "terraform-test"
  machine_type = "e2-micro"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }

  network_interface {
    network = "default"

    access_config {
      // Ephemeral IP
    }
  }
}