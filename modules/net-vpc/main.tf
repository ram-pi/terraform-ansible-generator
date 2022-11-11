resource "google_compute_network" "bootcamp" {
  name                    = var.net
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "bootcamp" {
  depends_on = [
    google_compute_network.bootcamp
  ]
  name          = var.subnet
  ip_cidr_range = var.cidr
  network       = google_compute_network.bootcamp.self_link
  region        = var.region
}
