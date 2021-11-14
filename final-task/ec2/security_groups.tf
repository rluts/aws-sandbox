resource "aws_security_group" "lohika_sg_public_http" {
  name   = "lohika_sg_public_http"
  vpc_id = var.vpc.id

  ingress {
    from_port   = 80
    protocol    = "tcp"
    to_port     = 80
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    protocol    = "tcp"
    to_port     = 443
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "lohika_sg_public_http"
  }
}

resource "aws_security_group" "lohika_sg_public_ssh" {
  name   = "lohika_sg_public_ssh"
  vpc_id = var.vpc.id

  ingress {
    from_port   = 22
    protocol    = "tcp"
    to_port     = 22
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "lohika_sg_public_ssh"
  }
}

resource "aws_security_group" "lohika_sg_private_http" {
  name   = "lohika_sg_private_http"
  vpc_id = var.vpc.id

  ingress {
    from_port   = 80
    protocol    = "tcp"
    to_port     = 80
    cidr_blocks = [var.vpc.cidr_block]
  }
  tags = {
    Name = "lohika_sg_private_http"
  }
}

resource "aws_security_group" "lohika_sg_private_ssh" {
  name   = "lohika_sg_private_ssh"
  vpc_id = var.vpc.id

  ingress {
    from_port   = 22
    protocol    = "tcp"
    to_port     = 22
    cidr_blocks = [var.vpc.cidr_block]
  }
  tags = {
    Name = "lohika_sg_private_ssh"
  }
}

resource "aws_security_group" "lohika_sg_public_egress" {
  name   = "lohika_sg_public_egress"
  vpc_id = var.vpc.id

  egress {
    from_port   = 0
    protocol    = "-1"
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "lohika_sg_public_egress"
  }
}

