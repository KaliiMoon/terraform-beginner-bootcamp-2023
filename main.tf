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

}

module "terrahouse_aws" {
  source = "./modules/terrahouse_aws"
  user_uuid = var.user_uuid
  bucket_name = var.bucket_name
}