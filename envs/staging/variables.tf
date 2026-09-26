# The root's own inputs. Everything else is written literally in main.tf,
# beside the module call, where you can read it.

variable "region" {
  description = "AWS region to build in"
  type        = string
  default     = "us-east-1"
}

variable "key_name" {
  description = "Name of an existing EC2 key pair"
  type        = string
}

variable "my_ip_cidr" {
  description = "Your public IP in CIDR form, for the SSH rule"
  type        = string
}

variable "aws_account_id" {
  description = "The AWS account this root is allowed to build in"
  type        = string
}
