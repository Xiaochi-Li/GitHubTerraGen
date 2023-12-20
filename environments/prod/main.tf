terraform {
  cloud {
    organization = "sean-li-terraform-cloud-learning"
    workspaces {
      name = "GitHubTerraGen_Prod"
    }
  }

  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 5.0"
    }

    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

## creating a repository for each config object in the repos list
module "repositories" {
  source = "../../modules/github_repo"
  count  = length(var.repositories)

  github_token               = var.github_token
  repo_name                  = var.repositories[count.index].repo_name
  aws_account_id_general     = var.aws_account_id_general
  aws_account_id_development = var.aws_account_id_development
  aws_account_id_production  = var.aws_account_id_production

  description = var.repositories[count.index].description
  visibility  = var.repositories[count.index].visibility
  roles       = var.repositories[count.index].roles

  providers = {
    github          = github
    aws.general     = aws.general
    aws.development = aws.development
    aws.production  = aws.production
  }
}
