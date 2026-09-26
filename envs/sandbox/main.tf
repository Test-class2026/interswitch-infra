locals {
  # The environment is decided by the shell, not by the files.
  # That convenience is also the argument against workspaces in production.
  instance_type = terraform.workspace == "loadtest" ? "t3.large" : "t2.micro"
}

module "k3s" {
  source = "../../modules/k3s-node"

  name          = "interswitch-k3s-${terraform.workspace}"
  environment   = terraform.workspace
  instance_type = local.instance_type
  volume_size   = 20
  key_name      = var.key_name
  my_ip_cidr    = var.my_ip_cidr
}

output "public_ip" {
  value = module.k3s.public_ip
}

output "workspace" {
  value = terraform.workspace
}
