variable "type" {
  type        = string
  description = "ingress or egress"
}

variable "from_port" {
  type        = number
  description = "The start port (or ICMP type number if protocol is icmp or icmpv6)"
}

variable "to_port" {
  type        = number
  description = "The end port (or ICMP code if protocol is icmp)"
}

variable "protocol" {
  type        = string
  default     = "tcp"
  description = "The protocol. If not tcp, icmp, icmpv6, tcp, udp, or all use the protocol number"
}

variable "security_group_id" {
  type        = string
  description = "The security group to apply this rule to"
}

variable "cidr_bocks" {
  type = list(string)
}