resource "aws_security_group" "wpc_sg" {
  name   = var.security_group_name
  vpc_id = var.vpc_id

  tags = {
    Name = join("-", [terraform.workspace, var.security_group_name, "sg"])
    env  = terraform.workspace
  }
}