variable "github_token" {
  description = "value of the GitHub token"
  type        = string
}

variable "repo_name" {
  description = "name of the repository"
  type        = string
}

variable "description" {
  description = "description of the repository"
  type        = string
}

variable "visibility" {
  type        = string
  description = "Visibility of the repository"
  default     = "private"

  validation {
    condition     = contains(["public", "private"], var.visibility)
    error_message = "The visibility must be either 'public' or 'private'."
  }
}