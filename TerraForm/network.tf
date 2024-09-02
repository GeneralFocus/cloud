resource "google_compute_network" "vpc_network" {
  name                    = "vpc-network"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "subnet" {
  name          = "subnet"
  network        = google_compute_network.vpc_network.self_link
  ip_cidr_range  = "10.0.0.0/24"
  region         = "us-central1"
}

resource "google_compute_firewall" "default" {
  name    = "default-firewall"
  network = google_compute_network.vpc_network.self_link

  allow {
    protocol = "tcp"
    ports    = ["22", "80", "443"]
  }

  source_ranges = ["0.0.0.0/0"]
}
