output "ec2_public_ip" {
  value = aws_instance.aws_week_3_instance.public_ip
}

output "rds_endpoint" {
  value = aws_db_instance.postgres.endpoint
}