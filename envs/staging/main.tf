module "k3s" {
  # Two levels up from envs/staging is the repository root,
  # so this reaches interswitch-infra/modules/k3s-node
  source = "../../modules/k3s-node"

  name          = "interswitch-k3s-staging"
  environment   = "staging"
  instance_type = "t3.small"
  volume_size   = 25
  key_name      = var.key_name
  my_ip_cidr    = var.my_ip_cidr
}

output "public_ip" {
  value = module.k3s.public_ip
}

output "portal_url" {
  value = module.k3s.portal_url
}

output "ssh_command" {
  value = module.k3s.ssh_command
}

output "instance_id" {
  value = module.k3s.instance_id
}

output "aws_account_id" {
  value = data.aws_caller_identity.current.account_id
}
