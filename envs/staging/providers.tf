terraform {
  required_version = ">= 1.10"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.region

  # Refuse to run if the loaded credentials belong to a different account.
  # Credentials choose the account; this is how you assert which one you meant.
  allowed_account_ids = [var.aws_account_id]

  # Applied to every resource this provider creates, so a tag can never be
  # forgotten. This is the fix for the untagged instance in the Week 15 case study.
  default_tags {
    tags = {
      ManagedBy   = "terraform"
      Environment = "staging"
      Repository  = "interswitch-infra"
    }
  }
}

# Report the account actually used, so it is visible after every apply
# rather than something you have to remember to check.
data "aws_caller_identity" "current" {}
