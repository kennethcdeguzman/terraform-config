variable "vpc_id" {
  type        = string
  description = "aws vpc id"
}

variable "cidr_block" {
  type        = string
  description = "CIDR block required for a subnet"
}

variable "availability_zone" {
  type        = string
  description = "AZ for the subnet"
}

variable "subnet_name" {
  type        = string
  description = "Name for the subnet"
}

variable "public" {
  type        = bool
  description = "is subnet public?"
}
