variable "tf-config-aws-region" {
  type        = string
  description = "AWS region"
}

variable "profile" {
  default     = "dev"
  type        = string
  description = "AWS account profile"
}