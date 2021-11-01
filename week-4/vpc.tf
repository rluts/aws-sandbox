resource "aws_vpc" "lohika_vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "lohika_vpc"
  }
}

resource "aws_subnet" "lohika_public_subnet" {
  cidr_block              = "10.0.1.0/24"
  vpc_id                  = aws_vpc.lohika_vpc.id
  availability_zone       = var.availability_zones[0]
  map_public_ip_on_launch = true
  tags = {
    Name = "lohika_public_subnet"
  }
}

resource "aws_subnet" "lohika_private_subnet" {
  cidr_block        = "10.0.2.0/24"
  vpc_id            = aws_vpc.lohika_vpc.id
  availability_zone = var.availability_zones[1]
  tags = {
    Name = "lohika_private_subnet"
  }
}

resource "aws_route_table" "lohika_private_subnet_route_table" {
  vpc_id = aws_vpc.lohika_vpc.id
  tags = {
    Name = "lohika_private_subnet_route_table"
  }
}

resource "aws_route_table" "lohika_public_subnet_route_table" {
  vpc_id = aws_vpc.lohika_vpc.id
  tags = {
    Name = "lohika_public_subnet_route_table"
  }
}

resource "aws_route" "lohika_public_subnet_route" {
  route_table_id         = aws_route_table.lohika_public_subnet_route_table.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.lohika_public_subnet_internet_gateway.id
}

resource "aws_route" "lohika_private_subnet_route" {
  route_table_id         = aws_route_table.lohika_private_subnet_route_table.id
  destination_cidr_block = "0.0.0.0/0"
  instance_id            = aws_instance.lohika_nat_server.id
}

resource "aws_internet_gateway" "lohika_public_subnet_internet_gateway" {
  vpc_id = aws_vpc.lohika_vpc.id
  tags = {
    Name = "lohika_public_subnet_internet_gateway"
  }
}

resource "aws_route_table_association" "public_subnet_route_table_association" {
  route_table_id = aws_route_table.lohika_public_subnet_route_table.id
  subnet_id      = aws_subnet.lohika_public_subnet.id
}

resource "aws_route_table_association" "private_subnet_route_table_association" {
  route_table_id = aws_route_table.lohika_private_subnet_route_table.id
  subnet_id      = aws_subnet.lohika_private_subnet.id
}




