output "filename" {
  value = local_file.key.filename
}

output "public_key" {
  value = tls_private_key.key.public_key_openssh
}
