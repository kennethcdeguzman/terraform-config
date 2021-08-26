variable "vpc_cidr_block" {
  type        = string
  description = "Vpc cidr block"
}

variable "vpc_instance_tenacity" {
  type        = string
  default     = "default"
  description = "Config to share instances on the host. Other values are dedicated or host"
}

variable "vpc_name" {
  type        = string
  description = "vpc name"
}

variable "enable_dns_hostnames" {
  type    = bool
  default = true
}

variable "enable_dns_support" {
  type    = bool
  default = true
}