# Terraform Beginner Bootcamp 2023 - Week 0

- [Terraform Beginner Bootcamp 2023](#terraform-beginner-bootcamp-2023)
  * [Table of Contents](#table-of-contents)
  * [Install the Terraform CLI](#install-the-terraform-cli)
    + [Considerations with the Terraform CLI changes](#considerations-with-the-terraform-cli-changes)
    + [Considerations for Linux Distributions](#considerations-for-linux-distributions)
    + [Refactoring into Bash Scripts](#refactoring-into-bash-scripts)
    + [Shebang](#shebang)
  * [Executions Considerations](#executions-considerations)
    + [Linux Permissions Considerations](#linux-permissions-considerations)
    + [Gitpod Lifecycle (Before, Init, Command)](#gitpod-lifecycle--before--init--command-)
    + [Working Env Vars](#working-env-vars)
      - [Setting and Unsetting Env Vars](#setting-and-unsetting-env-vars)
  * [Printing Vars](#printing-vars)
      - [Scoping of Env Vars](#scoping-of-env-vars)
      - [Persisting Env Vars in Gitpod](#persisting-env-vars-in-gitpod)
    + [AWS CLI Installation](#aws-cli-installation)
  * [#Terraform Basics](#-terraform-basics)
      - [Terraform Registry](#terraform-registry)
      - [Terraform Console](#terraform-console)
      - [Terraform Init](#terraform-init)
      - [Terraform Plan](#terraform-plan)
      - [Terraform Apply](#terraform-apply)
    + [Terraform Lock Files](#terraform-lock-files)
    + [Terraform State Files](#terraform-state-files)
    + [Terraform Directory](#terraform-directory)
      - [Terraform Destroy](#terraform-destroy)

<small><i><a href='http://ecotrust-canada.github.io/markdown-toc/'>Table of contents generated with markdown-toc</a></i></small>

## Install the Terraform CLI

### Considerations with the Terraform CLI changes
The Terraform CLI installation instructions have changed due to gpg keyring changes. So we needed to refer to the latest install CLI instructions via Terraform Documentation and change the scripting for install.

[Install Terraform CLI](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)

### Considerations for Linux Distributions

This project is bult against Ubuntu.
Please consider checking your Linux Distribution and change accordingly.

[How To Check OS Version in Linux](https://www.cyberciti.biz/faq/how-to-check-os-version-in-linux-command-line/)

Example of checking OS Version:

```

$ cat /etc/os-release
PRETTY_NAME="Ubuntu 22.04.3 LTS"
NAME="Ubuntu"
VERSION_ID="22.04"
VERSION="22.04.3 LTS (Jammy Jellyfish)"
VERSION_CODENAME=jammy
ID=ubuntu
ID_LIKE=debian
HOME_URL="https://www.ubuntu.com/"
SUPPORT_URL="https://help.ubuntu.com/"
BUG_REPORT_URL="https://bugs.launchpad.net/ubuntu/"
PRIVACY_POLICY_URL="https://www.ubuntu.com/legal/terms-and-policies/privacy-policy"
UBUNTU_CODENAME=jammy
```
### Refactoring into Bash Scripts

While fixing the Terraform CLI gpg depreciation issues we noticed that bash scripts steps were a considerable amount more to code. Decided to create a bash script to install the Terraform CLI.

This bash script is located here: [./bin/install_terraform_cli](./bin/install_terraform_cli)

-This will keep the Gitpod Task File ([.gitpod.yml](.gitpod.yml)) tidy.
-This allows us an easier way to debug and execute manually Terraform CLI install
-This will allow better portability for other projects that need to install Terraform CLI

### Shebang

Tells the bash script what program will interpret the script. eg. `#!/bin/bash`

[Examples of Shebang](https://en.wikipedia.org/wiki/Shebang_(Unix))

## Executions Considerations

When executing the bash script we can use the `./` shorthand notation to execute the bash script

eg. `./bin/install_terraform_cli`

If we are using a script in .gitpod.yml we need to point the script to a program to interpret it.

eg. `source ./bin/install_terraform_cli`

### Linux Permissions Considerations

In order to make our bash scripts executable we need to change linux permission for th fix to be executable at the user mode.

```sh
chmod u+x ./bin/install_terraform_cli
```

alternatively:

```sh
chmod 744 ./bin/install_terraform_cli
```

https://en.wikipedia.org/wiki/Chmod

### Gitpod Lifecycle (Before, Init, Command)

Be careful using Init becuase it will not rerun if we restart an existing workspace.

https://www.gitpod.io/docs/configure/workspaces/tasks


### Working Env Vars

List out all Environment Variables (Env Vars) using the `env` command

Use filter specific env vars using grep eg. `env | grep AWS_`

#### Setting and Unsetting Env Vars

In the terminal we can set using `export HELLO='world`

In the terminal we unset using `unset HELLO`

We can set an env var termporialy when just running a command

```
HELLO='world' ./bin/print_message
```

Within a bash script we can set env without writing export eg.

```sh
#!/usr/bin/env bash
HELLO='world'

echo $HELLO
```

## Printing Vars

We can print an env var using echo eg. `echo $HELLO`

#### Scoping of Env Vars

When you open up new bash terminals in VSCode it will not be aware of env vars that you have set in another window.

If you want Env Vars to persist across all future bash terminals that are open you need to set env vars in your bash profile. eg. `.bash_profile`

#### Persisting Env Vars in Gitpod

We can persist env vars into gitpod by storing them in Gitpod Secrets Storage.

```
gp env HELLO-'world'
```

All future workspaces launched will set the env vars for all bash terminals opened in those workspaces.

You can also set env vars in the `.gitpod.yml` but this can only contain non sensitive env vars.


### AWS CLI Installation

AWS CLI is installed for the project via the bash script [`./bin/install_aws_cli`](./bin/install_aws_cli)

[AWS CLI Installation](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html)
[AWS CLI Env Vars](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-envvars.html)

Check if AWS credentials is configured correctly by running the follwing AWS CLI command:
```sh
aws sts get-caller-identity
```


If successful you should see a json payload return that looks like this:

```json
{
    "UserId": "AKDAXCFMEPAPIUYC7YK5J",
    "Account": "123456789125",
    "Arn": "arn:aws:iam::123456789125:user/KaliMoon21"
}
```

Need to generate AWS CLI credits from IAM User in order to use AWS CLI.


## #Terraform Basics

#### Terraform Registry

Terraform sources their providers and modules from the Terraform registry located at [registry.terraform.io](https://registry.terraform.io/)

- **Providers** is an interface to APIs that allows you to create resources in terraform.
- **Modules** makes large amount of terraform code modular, portable and sharable.

[Random Terraform Provider](https://registry.terraform.io/providers/hashicorp/random)

#### Terraform Console

List of all Terraform commands by simply typing `terraform`

#### Terraform Init

At the start of a new terraform project we will run `terraform init`  to download the binaries for the terraform providers that we'll use in this project.

#### Terraform Plan

`terraform plan`

This will generate out a changeset, about the state of the infrastucture and what will be changed.

We can output this changeset ie. "plan" to be passed to an apply, but often you can just ignore outputting.

#### Terraform Apply

`terraform apply`

This will run a plan and pass the changeset to be executed by terraform. Apply should prompt yes or no.

If we want to automatically approve an apply without prompt we can provide the auto approve flag eg. `terraform apply --auto-aprrove`

### Terraform Lock Files

`.terraform.lock.hcl` contains the locked versioning for the providers or modules that should be used with this project.

The Terraform Lock File **should be committed** to your Version Control System (VSC) eg. Github

### Terraform State Files

`terraform.tfstate` contains information about the current state of your infrastructure.

This file **should not be committed.** To VCS.

This file can contain sensentive data.

If you lose this file, you lose knowing the state or your infrastucture.

`.terraform.tfstate.backup` is the previous state file.

### Terraform Directory

`.terraform` directory contains binaries of terraform providers.

#### Terraform Destroy

`terraform destroy`

This will destroy resources.




