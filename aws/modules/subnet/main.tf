resource "aws_subnet" "wpc_subnet" {
  vpc_id            = var.vpc_id
  cidr_block        = var.cidr_block
  availability_zone = var.availability_zone

  tags = {
    Name   = join("-", [terraform.workspace, var.subnet_name, "subnet"])
    env    = terraform.workspace
    public = var.public
  }
}