// create tls private key and store it on local filesystem
resource "tls_private_key" "key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "local_file" "key" {
  depends_on = [
    tls_private_key.key
  ]
  content         = tls_private_key.key.private_key_pem
  filename        = "${var.name}.pem"
  file_permission = "0600"
}
