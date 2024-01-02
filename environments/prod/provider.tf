
provider "github" {
  owner = "Xiaochi-Li"
  token = var.github_token
}

# the AWS provider configurations for different environments.

provider "aws" {
  region = "ap-southeast-2"
}