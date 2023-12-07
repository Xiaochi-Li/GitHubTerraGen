resource "github_repository" "repo" {
  name        = var.name
  description = var.description

  visibility = var.visibility
} 