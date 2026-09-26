# Inputs to the module. Anything that differs between environments is here;
# region and account are the caller's business, not this module's.

variable "name" {
  description = "Base name for every resource"
  type        = string
  default     = "interswitch-k3s"
}

variable "environment" {
  description = "Environment tag"
  type        = string
  default     = "staging"
}

variable "instance_type" {
  description = "EC2 size. t2.micro is free tier; t3.small is more comfortable for k3s"
  type        = string
  default     = "t3.micro"
}

variable "volume_size" {
  description = "Root volume size in GB"
  type        = number
  default     = 20
}

variable "key_name" {
  description = "Name of an existing EC2 key pair"
  type        = string
}

variable "my_ip_cidr" {
  description = "Your public IP in CIDR form, for the SSH rule"
  type        = string
}
