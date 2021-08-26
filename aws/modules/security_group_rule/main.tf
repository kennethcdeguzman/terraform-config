resource "aws_security_group_rule" "wpc_sg_rule" {
  from_port         = var.from_port
  protocol          = var.protocol
  to_port           = var.to_port
  type              = var.type
  security_group_id = var.security_group_id
  cidr_blocks       = var.cidr_bocks
}