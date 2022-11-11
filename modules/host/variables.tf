variable "name" {}
variable "machine_type" {}
variable "zone" {}
variable "metadata_startup_script" {}
variable "net" {}
variable "subnet" {}
variable "image_family" {}
variable "image_project" {}
variable "instance_tags" {
  type = list(string)
}
variable "is_public" {
  type    = bool
  default = false
}
variable "ssh_from" {}
variable "public_key_openssh" {}
