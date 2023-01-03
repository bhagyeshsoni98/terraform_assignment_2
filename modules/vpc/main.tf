resource "aws_vpc" "my_custom_vpc" {
  cidr_block           = var.vpc_cidr
  instance_tenancy     = "default"
  enable_dns_hostnames = true

  tags = {
    Name = "my_custom_vpc"
  }
}
