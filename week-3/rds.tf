resource "aws_db_instance" "postgres" {
  instance_class         = "db.t2.micro"
  engine                 = "postgres"
  engine_version         = "12.8"
  allocated_storage      = 20
  port                   = 5432
  name                   = "postgres_instance"
  username               = var.rds_credentials.username
  password               = var.rds_credentials.password
  db_subnet_group_name   = aws_db_subnet_group.postgres_sn_group.name
  vpc_security_group_ids = [aws_security_group.sg_rds.id]
  skip_final_snapshot    = true
}

resource "aws_db_subnet_group" "postgres_sn_group" {
  subnet_ids = data.aws_subnet_ids.subnets.ids
}
