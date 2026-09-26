terraform {
  backend "s3" {
    # One bucket for the whole account; one key per environment.
    # NOTE: replace 123456789012 with your AWS account number before init.
    bucket = "interswitch-tfstate-318928518784"
    key    = "prod/k3s/terraform.tfstate"
    region = "us-east-1"

    encrypt = true

    # Native S3 state locking (Terraform 1.10+). No DynamoDB table needed.
    use_lockfile = true
  }
}
