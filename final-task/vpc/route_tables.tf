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

resource "aws_route_table_association" "public_subnet_1_route_table_association" {
  route_table_id = aws_route_table.lohika_public_subnet_route_table.id
  subnet_id      = aws_subnet.lohika_public_subnet_1.id
}

resource "aws_route_table_association" "public_subnet_2_route_table_association" {
  route_table_id = aws_route_table.lohika_public_subnet_route_table.id
  subnet_id      = aws_subnet.lohika_public_subnet_2.id
}

resource "aws_route_table" "lohika_private_subnet_route_table" {
  vpc_id = aws_vpc.lohika_vpc.id
  tags = {
    Name = "lohika_private_subnet_route_table"
  }
}

resource "aws_route" "lohika_private_subnet_route" {
  route_table_id         = aws_route_table.lohika_private_subnet_route_table.id
  destination_cidr_block = "0.0.0.0/0"
  instance_id            = var.nat_server_id
}

resource "aws_route_table_association" "private_subnet_1_route_table_association" {
  route_table_id = aws_route_table.lohika_private_subnet_route_table.id
  subnet_id      = aws_subnet.lohika_private_subnet_1.id
}

resource "aws_route_table_association" "private_subnet_2_route_table_association" {
  route_table_id = aws_route_table.lohika_private_subnet_route_table.id
  subnet_id      = aws_subnet.lohika_private_subnet_2.id
}

