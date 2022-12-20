output "external_ip" {
  value = var.is_public ? google_compute_address.host[0].address : ""
}

output "internal_ip" {
  value = google_compute_instance.host.network_interface[0].network_ip
}

output "hostname" {
  value = google_compute_instance.host.name
}
