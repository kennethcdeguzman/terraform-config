####################################################
# Networking
####################################################
module "wpc_vpc" {
  source         = "../../modules/vpc"
  vpc_cidr_block = var.vpc_cidr_block[terraform.workspace]
  vpc_name       = "wpc"
}

module "wpc_internet_gateway" {
  source   = "../../modules/internet_gateway"
  igw_name = "wpc"
  vpc_id   = module.wpc_vpc.vpc_id
}

data "aws_availability_zones" "available_azs" {
  state = "available"
}

module "wpc_subnet" {
  count             = 3
  source            = "../../modules/subnet"
  availability_zone = data.aws_availability_zones.available_azs.names[count.index]
  cidr_block        = cidrsubnet(var.vpc_cidr_block[terraform.workspace], 7, count.index)
  public            = false
  subnet_name       = join("-", ["wpc", data.aws_availability_zones.available_azs.names[count.index]])
  vpc_id            = module.wpc_vpc.vpc_id
}

module "wpc_route_table" {
  source  = "../../modules/route_table"
  vpc_id  = module.wpc_vpc.vpc_id
  public  = true
  rt_name = "wpc"
}

//module "wpc_route" {
//  source                 = "../../modules/route"
//  for_each               = toset(["0.0.0.0/0", var.vpc_cidr_block[terraform.workspace]])
//  destination_cidr_block = each.key
//  gateway_id             = module.wpc_internet_gateway.id
//  route_table_id         = module.wpc_route_table.id
//}

module "wpc_route" {
  source                 = "../../modules/route"
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = module.wpc_internet_gateway.id
  route_table_id         = module.wpc_route_table.id
}

module "wpc_rt_association_gateway" {
  count          = 2
  source         = "../../modules/route_table_association_subnet"
  route_table_id = module.wpc_route_table.id
  subnet_id      = module.wpc_subnet[count.index].id
}


####################################################
# Compute
####################################################


//module "wpc_security_group" {
//  source              = "../../modules/security_group"
//  security_group_name = "wpc"
//  vpc_id              = module.wpc_vpc.vpc_id
//}
//
//module "wpc_security_group_rule_ingress" {
//  source            = "../../modules/security_group_rule"
//  from_port         = 0
//  security_group_id = module.wpc_security_group.id
//  to_port           = 65535
//  type              = "ingress"
//  cidr_bocks = [var.vpc_cidr_block[terraform.workspace]]
//}
//
//module "wpc_security_group_rule_ssh" {
//  source            = "../../modules/security_group_rule"
//  from_port         = 22
//  security_group_id = module.wpc_security_group.id
//  to_port           = 22
//  type              = "ingress"
//  cidr_bocks = [var.vpc_cidr_block[terraform.workspace]]
//}
//
//module "wpc_security_group_rule_egress" {
//  source            = "../../modules/security_group_rule"
//  from_port         = 0
//  security_group_id = module.wpc_security_group.id
//  to_port           = 65535
//  type              = "egress"
//  cidr_bocks = [var.vpc_cidr_block[terraform.workspace]]
//}

resource "aws_security_group" "wpc_security_group" {
  name   = join("-", [var.application_name, terraform.workspace])
  vpc_id = module.wpc_vpc.vpc_id

  ingress {
    from_port   = "0"
    protocol    = "TCP"
    to_port     = "65535"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = "22"
    protocol    = "TCP"
    to_port     = "22"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = "0"
    protocol    = "TCP"
    to_port     = "65535"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

//module "wpc_ec2_instance" {
//  source                 = "../../modules/ec2"
//  application_name       = var.application_name
//  subnet_id              = module.wpc_subnet[0].id
//  vpc_security_group_ids = [aws_security_group.wpc_security_group.id]
//  key_name               = var.key_name
//}