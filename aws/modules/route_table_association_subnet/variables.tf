variable "route_table_id" {
  type        = string
  description = "The ID of the routing table to associate with"
}

variable "subnet_id" {
  type        = string
  description = "the gateway ID to create an association. Conflicts with subnet_id"
}
