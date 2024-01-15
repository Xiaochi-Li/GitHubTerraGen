# GitHubTerraGen

## Overview

GitHubTerraGen is a tool powered by Terraform, designed to automate the management of personal GitHub repositories. It simplifies the process of creating, configuring, and archiving repositories, while also provisioning the necessary IAM roles and permissions for each repository.

## Key Features

- **Automated Repository Management:** GitHubTerraGen streamlines the process of creating and configuring GitHub repositories, making repository management more efficient.

- **IAM Role and Permission Provisioning:** GitHubTerraGen automatically sets up appropriate IAM roles and permissions for each repository.
  - **Security:** Each IAM role can only be assumed by its corresponding repository via OIDC. Furthermore, for roles created in different environments (AWS accounts), the environment must match to successfully assume the role. Developers can also configure minimum permission rules for those roles, enhancing security.
  - **Flexibility:** GitHubTerraGen provides the flexibility to configure different permission rules for roles in different environments (AWS accounts), offering a flexible approach to permission configuration.

- **Repository Archiving:** GitHubTerraGen simplifies the process of archiving repositories based on defined criteria.

- **Infrastructure as Code:** GitHubTerraGen leverages the power of Terraform to provide reliable and repeatable setups.

## How to use

to be add later..
