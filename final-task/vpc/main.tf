resource "aws_vpc" "lohika_vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "lohika_vpc"
  }
}

resource "aws_internet_gateway" "lohika_public_subnet_internet_gateway" {
  vpc_id = aws_vpc.lohika_vpc.id
  tags = {
    Name = "lohika_public_subnet_internet_gateway"
  }
}