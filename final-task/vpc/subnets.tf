resource "aws_subnet" "lohika_public_subnet_1" {
  cidr_block              = "10.0.1.0/24"
  vpc_id                  = aws_vpc.lohika_vpc.id
  availability_zone       = var.availability_zones[0]
  map_public_ip_on_launch = true
  tags = {
    Name = "lohika_public_subnet"
  }
}

resource "aws_subnet" "lohika_public_subnet_2" {
  cidr_block              = "10.0.2.0/24"
  vpc_id                  = aws_vpc.lohika_vpc.id
  availability_zone       = var.availability_zones[1]
  map_public_ip_on_launch = true
  tags = {
    Name = "lohika_public_subnet"
  }
}

resource "aws_subnet" "lohika_private_subnet_1" {
  cidr_block        = "10.0.3.0/24"
  vpc_id            = aws_vpc.lohika_vpc.id
  availability_zone = var.availability_zones[2]
  tags = {
    Name = "lohika_private_subnet"
  }
}

resource "aws_subnet" "lohika_private_subnet_2" {
  cidr_block        = "10.0.4.0/24"
  vpc_id            = aws_vpc.lohika_vpc.id
  availability_zone = var.availability_zones[3]
  tags = {
    Name = "lohika_private_subnet"
  }
}