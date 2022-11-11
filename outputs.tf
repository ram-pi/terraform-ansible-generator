output "cp_instance_external_ip" {
  value = module.cp_instance[*].external_ip
}

output "cp_instance_internal_ip" {
  value = module.cp_instance[*].internal_ip
}

output "ssh_key_filename" {
  value = module.ssh_key.filename
}

output "personal_ip" {
  value = data.http.ip.response_body
}

output "gcp_user" {
  value = split("@", data.google_client_openid_userinfo.userinfo.email)[0]
}
