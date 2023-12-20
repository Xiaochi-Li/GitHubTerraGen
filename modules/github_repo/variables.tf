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

variable "aws_account_id_development" {
  description = "value of the development AWS account id"
  type        = string
  sensitive   = true
}

variable "aws_account_id_production" {
  description = "value of the production AWS account id"
  type        = string
  sensitive   = true
}

variable "aws_account_id_general" {
  description = "value of the general AWS account id"
  type        = string
  sensitive   = true
}

variable "roles" {
  type = list(object({
    aws_account : string,
    policy_file_path : string
  }))
  description = "List of roles to be created for the repository"
}