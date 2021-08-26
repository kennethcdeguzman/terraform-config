provider "aws" {
  region  = var.tf-config-aws-region
  profile = var.profile
}

module "application-infrastructure" {
  source = "./aws/applications"
}