terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 5.0"
    }
  }
}

provider "github" {
  token = "your_personal_access_token"
  owner = "your_github_username_or_org"
}

resource "github_repository" "example" {
  name        = "my-new-repo"
  description = "This is my new GitHub repository created using Terraform"
  visibility  = "private"
  auto_init   = true
}