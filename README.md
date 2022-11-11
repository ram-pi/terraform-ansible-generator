# Terraform CP-Ansible bootstrapper

Create n instances for running on cp-ansible and modify hosts.yml with their external IPs.  
It provides you a key to access via ssh to the VMs.  
You'll need:

- VPC on Google Cloud  

## Variables

terraform.tfvars template

```hcl
project = ""
region  = ""
zone    = ""
net     = ""
subnet  = ""
# cp_instance
cp_instance_name         = ""
cp_instance_machine_type = ""
#cp_instance_metadata_startup_script = "sudo apt update -y; sudo apt-get install python3-distutils -y; sudo apt install python3-pip -y ; sudo apt install silversearcher-ag jq haproxy unzip openjdk-11-jdk -y; sudo apt install software-properties-common -y; sudo apt-add-repository ppa:ansible/ansible -y; sudo apt update; sudo apt install ansible -y"
cp_instance_script_filepath = ""
cp_instance_image_project   = ""
cp_instance_image_family    = ""
cp_instance_tags            = [""]
cp_instance_is_public       = true
cp_instance_count           = 3
```
