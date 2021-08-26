

variable "instance_type" {
  default     = "t2.micro"
  type        = string
  description = "EC2 instance type"
}

variable "ami" {
  default     = "ami-0e999cbd62129e3b1"
  type        = string
  description = "Amazon Machine Images"
}

variable "application_name" {
  type        = string
  description = "WPC-Broker"
}

variable "subnet_id" {
  type        = string
  description = "ec2 instance subnets"
}

variable "vpc_security_group_ids" {
  type        = list(string)
  description = "A list of security group IDs to associate with"
}

variable "key_name" {
  type = string
}

variable "associate_public_ip_address" {
  type    = bool
  default = true
}