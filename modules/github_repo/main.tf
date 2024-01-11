resource "github_repository" "repo" {
  name        = var.repo_name
  description = var.description
  visibility  = var.visibility
}
