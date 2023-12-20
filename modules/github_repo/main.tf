resource "github_repository" "repo" {
  name        = var.repo_name
  description = var.description

  visibility = var.visibility
}

module "iam_roles_in_general_account" {
  providers = {
    aws = aws.general
  }
  source = "../../modules/iam_role"

  # Only create roles in the general account.
  count = length([for role in var.roles : role if role.aws_account == "general"])

  repo_name        = var.repo_name
  aws_account_id   = var.aws_account_id_general
  policy_file_path = var.roles[count.index].policy_file_path
}

module "iam_roles_in_development_account" {
  providers = {
    aws = aws.development
  }
  source = "../../modules/iam_role"

  # Only create roles in the development account.
  count = length([for role in var.roles : role if role.aws_account == "development"])

  repo_name        = var.repo_name
  aws_account_id   = var.aws_account_id_development
  policy_file_path = var.roles[count.index].policy_file_path
}

module "iam_roles_in_production_account" {
  providers = {
    aws = aws.production
  }
  source = "../../modules/iam_role"

  # Only create roles in the production account.
  count = length([for role in var.roles : role if role.aws_account == "production"])

  repo_name        = var.repo_name
  aws_account_id   = var.aws_account_id_production
  policy_file_path = var.roles[count.index].policy_file_path
}