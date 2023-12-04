terraform {
  cloud {
    organization = "sean-li-terraform-cloud-learning"

    workspaces {
      name = "GitHubTerraGen_Prod"
    }
  }
}