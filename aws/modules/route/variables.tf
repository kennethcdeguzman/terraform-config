variable "route_table_id" {
  type        = string
  description = "the id of the routing table"
}

variable "destination_cidr_block" {
  type        = string
  description = "The destination cidr block"
}

variable "gateway_id" {
  type        = string
  description = "Identifier of a vpc internet gateway or a virtual private gateway"
}