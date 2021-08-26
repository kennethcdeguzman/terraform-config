resource "aws_route_table" "wpc_rt" {
  vpc_id = var.vpc_id

  tags = {
    Name   = join("-", [terraform.workspace, var.rt_name, "route_table"])
    env    = terraform.workspace
    public = var.public
  }
}