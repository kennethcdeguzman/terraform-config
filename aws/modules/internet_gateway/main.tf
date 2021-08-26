resource "aws_internet_gateway" "wpc_igw" {
  vpc_id = var.vpc_id

  tags = {
    Name = join("-", [terraform.workspace, var.igw_name, "igw"])
    env  = terraform.workspace
  }
}