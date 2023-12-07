resource "github_repository" "example" {
  name        = var.name
  description = var.description

  visibility = var.visibility
} 