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
  }
}

locals {
  repositories = jsondecode(file("../../configs/repositories.json"))
}

## creating a repository for each config object in the repos list
module "repositories" {
  source = "../../modules/github_repo"
  count  = length(local.repositories)

  github_token = var.github_token
  repo_name    = local.repositories[count.index].repo_name
  description  = local.repositories[count.index].description

  visibility = local.repositories[count.index].visibility

  providers = {
    github = github
  }
}


