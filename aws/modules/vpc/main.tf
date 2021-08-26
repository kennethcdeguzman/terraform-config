resource "aws_vpc" "wpc_vpc" {
  cidr_block           = var.vpc_cidr_block
  instance_tenancy     = var.vpc_instance_tenacity
  enable_dns_hostnames = var.enable_dns_hostnames
  enable_dns_support   = var.enable_dns_support

  tags = {
    Name = join("-", [terraform.workspace, var.vpc_name, "vpc"])
    env  = terraform.workspace
  }

}
