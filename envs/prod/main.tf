module "k3s" {
  source = "../../modules/k3s-node"

  name          = "interswitch-k3s-prod"
  environment   = "prod"
  instance_type = "t3.medium"
  volume_size   = 40
  key_name      = var.key_name
  my_ip_cidr    = var.my_ip_cidr
}

output "public_ip" {
  value = module.k3s.public_ip
}

output "portal_url" {
  value = module.k3s.portal_url
}

output "instance_id" {
  value = module.k3s.instance_id
}
