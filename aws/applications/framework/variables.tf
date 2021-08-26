variable "vpc_cidr_block" {
  type = map(string)
  default = {
    dev  = "10.0.0.0/16"
    prod = "11.0.0.0/16"
  }
}

variable "application_name" {
  type = string
}

variable "key_name" {}