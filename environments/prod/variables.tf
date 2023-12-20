variable "github_token" {
  description = "value of the GitHub token"
  sensitive   = true
  type        = string
}

variable "aws_account_id_general" {
  description = "value of the general AWS account id"
  type        = string
  sensitive   = true
}

variable "aws_account_id_development" {
  description = "value of the development AWS account id"
  type        = string
  sensitive   = true
}

variable "aws_account_id_production" {
  description = "value of the production AWS account id"
  type        = string
  sensitive   = false
}

variable "repositories" {
  description = "configuration for the repositories"
  type = list(object({
    repo_name   = string
    description = string
    visibility  = string
    roles = list(object({
      aws_account : string,
      policy_file_path : string
    }))
  }))
}