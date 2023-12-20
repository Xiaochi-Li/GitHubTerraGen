
provider "github" {
  owner = "Xiaochi-Li"
  token = var.github_token
}

# the AWS provider configurations for different environments.

provider "aws" {
  alias  = "general"
  region = "ap-southeast-2"
  assume_role {
    role_arn     = "arn:aws:iam::${var.aws_account_id_general}:role/GitHubTerraGen" # find a way to dynamically get the account id and role name
    session_name = "GitHubTerraGen"
  }
}

provider "aws" {
  alias  = "development"
  region = "ap-southeast-2"
  assume_role {
    role_arn     = "arn:aws:iam::${var.aws_account_id_development}:role/GitHubTerraGen" # find a way to dynamically get the account id and role name
    session_name = "GitHubTerraGen"
  }
}

provider "aws" {
  alias  = "production"
  region = "ap-southeast-2"
  assume_role {
    role_arn     = "arn:aws:iam::${var.aws_account_id_production}:role/GitHubTerraGen" # find a way to dynamically get the account id and role name
    session_name = "GitHubTerraGen"
  }
}