// host external IP
data "http" "ip" {
  url = "https://ifconfig.me"
}

// gcp user account
data "google_client_openid_userinfo" "userinfo" {}

module "ssh_key" {
  #source = "github.com/ram-pi/terraform-modules/modules/ssk-key"
  source = "./modules/ssh-key"
}

module "cp_instance" {
  count = var.cp_instance_count

  #source = "github.com/ram-pi/terraform-modules/modules/host"
  source = "./modules/host"

  name         = "${var.cp_instance_name}${count.index}"
  zone         = var.zone
  machine_type = var.cp_instance_machine_type
  net          = var.net
  subnet       = var.subnet
  #metadata_startup_script = var.cp_instance_metadata_startup_script
  metadata_startup_script = var.cp_instance_script_filepath
  image_project           = var.cp_instance_image_project
  image_family            = var.cp_instance_image_family
  instance_tags           = var.cp_instance_tags
  is_public               = var.cp_instance_is_public
  ssh_from                = data.http.ip.response_body
  public_key_openssh      = module.ssh_key.public_key
}

resource "local_file" "inventory" {
  source   = "./files/template.yml"
  filename = "./files/hosts.yml"
}

resource "null_resource" "inventory" {
  count = var.cp_instance_count

  provisioner "local-exec" {
    command = "echo ${module.cp_instance[count.index].internal_ip} >> output.log"
  }

  provisioner "local-exec" {
    command = "echo ${module.cp_instance[count.index].external_ip} >> output.log"
  }
}
