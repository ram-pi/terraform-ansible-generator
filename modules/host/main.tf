/* 
* Create a compute engine instance and provide ssh access through pem certificate and external ip address
*/

// data for retrieving user email
data "google_client_openid_userinfo" "userinfo" {}

data "google_compute_image" "host" {
  family  = var.image_family
  project = var.image_project
}

// create external ip address
resource "google_compute_address" "host" {
  count = var.is_public ? 1 : 0

  name         = "${var.name}-address"
  address_type = "EXTERNAL"
}

// create instance
resource "google_compute_instance" "host" {
  depends_on = [
    google_compute_address.host
  ]

  tags         = var.instance_tags
  name         = var.name
  machine_type = var.machine_type
  zone         = var.zone

  boot_disk {
    initialize_params {
      image = data.google_compute_image.host.self_link
    }
  }

  metadata_startup_script = try(file(var.metadata_startup_script), "")
  network_interface {
    network    = var.net
    subnetwork = var.subnet

    access_config {
      nat_ip = var.is_public ? google_compute_address.host[0].address : ""
    }
  }

  metadata = {
    ssh-keys = "${split("@", data.google_client_openid_userinfo.userinfo.email)[0]}:${var.public_key_openssh}"
  }
}

// allow ssh traffic
resource "google_compute_firewall" "host" {
  // TODO: Fix firewall rules out of limits error
  //count = var.is_public ? 1 : 0

  name          = "${var.name}-allow-all"
  target_tags   = var.instance_tags
  source_ranges = ["${var.ssh_from}/32"]
  network       = var.net
  allow {
    protocol = "tcp"
    #ports    = ["22"]
  }
}
