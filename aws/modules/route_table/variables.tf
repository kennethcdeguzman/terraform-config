variable "vpc_id" {
  type        = string
  description = "aws vpc id"
}

variable "rt_name" {
  type        = string
  description = "route table name"
}

variable "public" {
  type        = bool
  description = "is subnet public?"
}