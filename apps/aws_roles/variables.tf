variable "aws_account" {
  description = "value of the AWS account"
  sensitive   = true
  type        = string
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