output "rds_host" {
  value = replace(aws_db_instance.postgres.endpoint, ":5432", "")
}
