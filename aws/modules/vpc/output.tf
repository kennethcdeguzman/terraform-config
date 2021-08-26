output "vpc_id" {
  value = aws_vpc.wpc_vpc.id
}
output "vpc_default_security_group_id" {
  value = aws_vpc.wpc_vpc.default_security_group_id
}

output "cidr_block_associations" {
  value = aws_vpc.wpc_vpc.cidr_block
}