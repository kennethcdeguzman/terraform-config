
output "server_ip" {
  value       = join(",", aws_instance.ec2.*.private_ip)
  description = "The private IP address of the main server instance."
}

output "id" {
  value = tolist(aws_instance.ec2.*.id)
}

output "public_ip" {
  value = aws_instance.ec2.public_ip
}

