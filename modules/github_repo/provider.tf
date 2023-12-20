terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 5.0"
    }
    aws = {
      source = "hashicorp/aws"
      configuration_aliases = [
        aws.general,
        aws.development,
        aws.production
      ]
    }
  }
}
