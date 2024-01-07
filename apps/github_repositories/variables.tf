variable "github_token" {
  description = "value of the GitHub token"
  sensitive   = true
  type        = string
}

# variable "env" {
#   description = "value of the environment"
#   type        = string
# }

# variable "repositories" {
#   description = "configuration for the repositories"
#   type = list(object({
#     repo_name   = string
#     description = string
#     visibility  = string
#     roles = list(object({
#       aws_account : string,
#       policy_file_path : string
#     }))
#   }))
# }