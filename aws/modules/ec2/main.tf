resource "aws_instance" "ec2" {
  ami                         = var.ami
  instance_type               = var.instance_type
  subnet_id                   = var.subnet_id
  vpc_security_group_ids      = var.vpc_security_group_ids
  associate_public_ip_address = var.associate_public_ip_address
  key_name                    = var.key_name
  tags = {
    Name = join("-", [terraform.workspace, var.application_name])
    env  = terraform.workspace
  }

  provisioner "local-exec" {
    command = "echo ${aws_instance.ec2.public_dns}"
  }
}

