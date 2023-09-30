terraform {
    #backend "remote" {
    #  hostname = "app.terraform.io"
    #  organization = "terraformbootcamp2023km"

    #  workspaces {
    #    name = "kali-terra-house"
    #  }
    #}
 cloud {
    organization = "terraformbootcamp2023km"
    workspaces {
      name = "kali-terra-house"
    }
  }

  required_providers {
    random = {
      source = "hashicorp/random"
      version = "3.5.1"
    }
    aws = {
      source = "hashicorp/aws"
      version = "5.18.1"
    }
  }
}

provider "aws" {
  # Configuration options
}
provider "random" {
  # Configuration options
}

resource "random_string" "bucket_name" {
  lower = true
  upper = false
  length   = 32
  special  = false
}

resource "aws_s3_bucket" "example" {
  bucket = random_string.bucket_name.result
}

output "random_bucket_name" {
  value = random_string.bucket_name.result
}
