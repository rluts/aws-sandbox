data "template_file" "user_data_public" {
  template = file("${path.module}/templates/user-data.tpl")
  vars = {
    bucket_name    = var.bucket_name
    file_name      = var.calc_app_file_name
    environments   = "{}"
    extra_commands = "[]"
  }
}

data "template_file" "user_data_private" {
  template = file("${path.module}/templates/user-data.tpl")
  vars = {
    bucket_name  = var.bucket_name
    file_name    = var.persist_app_file_name
    environments = jsonencode({ RDS_HOST = var.rds_host })
    extra_commands = jsonencode([
      "amazon-linux-extras install postgresql12",
      "echo \"psql -h ${var.rds_host} -U ${var.rds_credentials.username} ${var.rds_name}\" > /root/postgres-connect.sh && chmod +x /root/postgres-connect.sh"
    ])
  }
}
