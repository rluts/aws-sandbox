resource "aws_security_group" "sg_rds" {
  name   = "sg_rds"
  vpc_id = var.vpc.id

  ingress {
    from_port   = 5432
    protocol    = "tcp"
    to_port     = 5432
    cidr_blocks = [var.vpc.cidr_block]
  }
}