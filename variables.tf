variable "project" {}
variable "region" {}
variable "zone" {}
variable "subnet" {}
variable "net" {}
# cp_instance instance
variable "cp_instance_name" {}
variable "cp_instance_machine_type" {}
#variable "cp_instance_metadata_startup_script" {}
variable "cp_instance_script_filepath" {}
variable "cp_instance_image_family" {}
variable "cp_instance_image_project" {}
variable "cp_instance_tags" {
  type = list(string)
}
variable "cp_instance_is_public" {
  type    = bool
  default = true
}

variable "cp_instance_count" {
  type    = number
  default = 3
}
