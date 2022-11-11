terraform {
  required_version = ">= 1.1.0"
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 4.25.0" # tftest
    }
    tls = {
      source  = "hashicorp/tls"
      version = "3.1.0"
    }
  }
}