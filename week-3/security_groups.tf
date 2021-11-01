resource "aws_security_group" "sg_ssh" {
  name = "sg_ssh"

  ingress {
    from_port   = 22
    protocol    = "tcp"
    to_port     = 22
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    protocol    = -1
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "sg_http" {
  name = "sg_http"

  ingress {
    from_port = 80
    protocol  = "tcp"
    to_port   = 80
  }
  ingress {
    from_port = 443
    protocol  = "tcp"
    to_port   = 443
  }
}

resource "aws_security_group" "sg_rds" {
  name = "sg_rds"

  ingress {
    from_port   = 5432
    protocol    = "tcp"
    to_port     = 5432
    cidr_blocks = [aws_default_vpc.default_vpc.cidr_block]
  }
}