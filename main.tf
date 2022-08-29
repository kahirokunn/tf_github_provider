terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 4.0"
    }
  }
}

provider "github" {}

resource "github_repository" "foo" {
  name      = "tf-acc-test"
  auto_init = true
}

output "name" {
  value = github_repository.foo.name
}

resource "github_repository_file" "foo" {
  repository          = github_repository.foo.name
  branch              = "main"
  file                = ".gitignore"
  content             = "**/*.tfstate"
  commit_message      = "Managed by Terraform"
  commit_author       = "Terraform User"
  commit_email        = "terraform@example.com"
}
