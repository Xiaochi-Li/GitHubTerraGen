terraform {
  cloud {
    organization = "sean-li-terraform-cloud-learning"
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

locals {
  flattened_roles = flatten([
    for repo in jsondecode(file("../../configs/repositories.json")).repositories : [
      for role in repo.roles : {
        repo_name        = repo.repo_name
        aws_account      = role.aws_account
        policy_file_path = role.policy_file_path
      } if role.aws_account == var.aws_account # Only include the roles for the current AWS account environment
    ]
  ])
}


module "iam_roles" {
  source = "../../modules/iam_role"
  count  = length(local.flattened_roles)

  repo_name        = local.flattened_roles[count.index].repo_name
  aws_account_id   = local.flattened_roles[count.index].aws_account
  policy_file_path = local.flattened_roles[count.index].policy_file_path

  providers = {
    aws = aws
  }
}