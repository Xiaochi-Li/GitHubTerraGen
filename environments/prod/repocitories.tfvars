repositories = [
  {
    "repo_name" : "oz-fire-calculator",
    "description" : "This is oz-fire-calculator",
    "visibility" : "public",
    "roles" : [
      {
        "aws_account" : "general",
        "policy_file_path" : "gen-admin-policy.json"
      },
      {
        "aws_account" : "development",
        "policy_file_path" : "gen-developer-policy.json"
      },
      {
        "aws_account" : "production",
        "policy_file_path" : "gen-production-policy.json"
      }
    ]
  }
]