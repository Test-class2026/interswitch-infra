# A child module states what it needs, but never configures a provider.
# The provider comes from whichever root module calls this one.
terraform {
  required_version = ">= 1.10"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}
