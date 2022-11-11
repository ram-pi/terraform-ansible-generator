output "net" {
   value = google_compute_network.bootcamp.id
}

output "subnet" {
  value = google_compute_subnetwork.bootcamp.id
}

output "cidr" {
   value = google_compute_subnetwork.bootcamp.ip_cidr_range
}