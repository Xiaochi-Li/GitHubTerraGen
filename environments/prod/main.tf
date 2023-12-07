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

## storing repository configureations in a local map
locals {
  repos = jsondecode(file("../../configs/repos.json"))
}

## creating a repository for each config object in the repos list
module "github_repos" {
  source       = "../../modules/github_repos"
  github_token = var.github_token
  count        = length(local.repos)

  name        = local.repos[count.index].name
  description = local.repos[count.index].description
  visibility  = local.repos[count.index].visibility
}