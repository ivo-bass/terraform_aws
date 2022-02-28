provider "aws" {
  region = var.region_name
}

resource "aws_vpc" "TerraformVPC" {
  cidr_block = var.vpc_cidr_range
  tags = {
    Name = var.vpc_name
  }
}
