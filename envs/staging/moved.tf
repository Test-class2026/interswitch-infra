# Tells Terraform that these resources were renamed, not replaced.
# Without these four blocks a refactor into a module plans to destroy the
# running server and build another one.
#
# Only needed when state already holds the old, flat addresses. Delete this
# file a release or two after the refactor has landed everywhere.

moved {
  from = aws_security_group.k3s
  to   = module.k3s.aws_security_group.k3s
}

moved {
  from = aws_eip.k3s
  to   = module.k3s.aws_eip.k3s
}

moved {
  from = aws_instance.k3s
  to   = module.k3s.aws_instance.k3s
}

moved {
  from = aws_eip_association.k3s
  to   = module.k3s.aws_eip_association.k3s
}
