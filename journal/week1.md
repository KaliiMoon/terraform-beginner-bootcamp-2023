# Terraform-beginner-bootcamp-2023 - Week 1

## Root Module Structure

Root Module structure:

- PROJECT_ROOT
  
  - main.tf - everything else
  - variables.tf - stores the structure of input variables
  - providers.tf
  - outputs.tf - stores our outputs
  - terraform.tfvars - data of variables we want to load into terraform project
  - README.md - required for root modules

[Standard Structure Module](https://developer.hashicorp.com/terraform/language/modules/develop/structure)

## Terraform and Input Variables


## Terraform Cloud Variables

In terraform we can set two kinds of variables:
  - Environment Variables - set in your bash terminal eg. AWS credentials
  - Terraform Variables - set in your tfvars files

  Set Terraform Cloud variables sensentive 

  ### Loading Terraform Variables

  [Terraform Input Variables](https://developer.hashicorp.com/terraform/language/values/variables)

  Use `-var` flag to set an input variable or override a variable in the tfvars file eg. `terraform -var user_uuid="my_user_id"`

  ### var file flag

  - TODO: document this flag

  ### terraform.tfvars

  Set this default file to laod in terraform variables in blunk

  ### auto.tfvars

  - TODO: document this functionality for terraform cloud

  ### order of terraform variables

  - TODO: document which terraform variables take presedence

## What happens if we lose our state file?

You will have to tear down all your cloud infrastruture manually.

You can use terraform import but it won't work for all cloud resources. You need to check the terraform providers documentation for which resources support import.

### Fix missing Resources with Terraform Import

`terraform import aws_s3_bucket.bucket bucket-name`

[Terraform Import](https://developer.hashicorp.com/terraform/cli/import)
[AWS S3 Bucket Import](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/string)

## Dealing With Configuration Drift

### Fix manual Configuration

If someone delets or modifies cloud resources manually through ClickOps.

Run Terraform Plan with attemple to put infrastructure into the expected state, fixing configuration drift


## Fix using Terraform Refresh

```sh
terraform apply -refresh-only -auto-approve
```

## Terraform Modules

### Terraform Module Stucture
A module should be placed in a `modules` directory when locally developing modules but you can name it whatever you like.

### Module Sources

Using the source we can import the module form variour places eg: 
  - locally
  - Github
  - Terraform Registry

### Passing Input Variables

We can pass input variables to modulces
The module has to declare the terraform variables in its own variables.tf

```terraform
module "terrahouse_aws" {
  source = "./modules/terrahouse_aws"
  user_uuid = var.user_uuid
  bucket_name = var.bucket_name
}

[Module Sources](https://developer.hashicorp.com/terraform/language/modules/sources#local-paths)


## Considerations when using ChatGPT to write Terraform

Large Language Models as ChatGPT may not be trained on the latest documenation or information about Terraform

## Working with Files in Terraform


### Path Variables

In Terraform there is a special variable called `path` that allows us to reference local paths:
  - path.root = get the path of root module
  - path.module = get the path for the current module

[Special Path Variable](https://developer.hashicorp.com/terraform/language/expressions/references)

## Working with JSON

Use the jsonencode to create the json policy inline in the hcl.

```tf
> jsonencode({"hello"="world"})
{"hello":"world"}
```

### Changing Lifecycle Resources

[Meta Arguments Lifecycle](https://developer.hashicorp.com/terraform/language/meta-arguments/lifecycle)

## Provisioners

## For Each Expressions

[For Each](https://developer.hashicorp.com/terraform/language/meta-arguments/for_each)

