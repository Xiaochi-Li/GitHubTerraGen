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

module "github_repos" {
  source       = "../../modules/github_repos"
  github_token = var.github_token
}