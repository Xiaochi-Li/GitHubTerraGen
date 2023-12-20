resource "aws_iam_role" "oidc_role" {
  name = "${var.repo_name}-oidc-role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRoleWithWebIdentity"
        Effect = "Allow"
        Principal = {
          Federated = "arn:aws:iam::${var.aws_account_id}:oidc-provider/token.actions.githubusercontent.com"
        }
        Condition = {
          StringEquals = {
            "token.actions.githubusercontent.com:sub" = "repo:${var.repo_name}:environment:*"
          }
        }
      }
    ]
  })
}
