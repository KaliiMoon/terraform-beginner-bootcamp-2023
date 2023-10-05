terraform {
    #backend "remote" {
    #  hostname = "app.terraform.io"
    #  organization = "terraformbootcamp2023km"

    #  workspaces {
    #    name = "kali-terra-house"
    #   }
    #}
    #cloud {
    # organization = "terraformbootcamp2023km"
    # workspaces {
    #   name = "kali-terra-house"
    # }
    #}
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.18.1"
    }
  }
}

provider "aws" {
}
provider "random" {
  # Configuration options
}
  
