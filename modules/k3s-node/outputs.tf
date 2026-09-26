output "public_ip" {
  description = "Public address of the k3s node"
  value       = aws_eip.k3s.public_ip
}

output "ssh_command" {
  description = "Ready-made SSH command"
  value       = "ssh -i ${var.key_name}.pem ubuntu@${aws_eip.k3s.public_ip}"
}

output "portal_url" {
  description = "Where the portal will answer once Helm has deployed"
  value       = "http://${aws_eip.k3s.public_ip}/"
}

output "instance_id" {
  description = "EC2 instance ID of the node"
  value       = aws_instance.k3s.id
}
