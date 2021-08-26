variable "vpc_id" {
  type = map(map(string))

  default = {
    env = {
      dev = "vpc-0b95e2ea800116e34"
    }
  }
}

variable "subnet_id" {
  type = map(map(string))

  default = {
    private = {
      subnet-a = "subnet-0b75dc6277df971da"
      subnet-b = "subnet-0a649c3896b1ed0f6"
    }
    public = {
      subnet-a = "subnet-05d72d06c24881661"
      subnet-b = "subnet-07d02e48d908e513e"
    }
  }
}

variable "vpc_cidr_block" {
  default = ""
}
