data "template_file" "user_data_public" {
  template = file("${path.module}/templates/user-data.tpl")
  vars = {
    bucket_name   = var.bucket_name
    file_name     = var.calc_app_file_name
    environments  = "{}"
    installations = "[]"
  }
}

data "template_file" "user_data_private" {
  template = file("${path.module}/templates/user-data.tpl")
  vars = {
    bucket_name   = var.bucket_name
    file_name     = var.persist_app_file_name
    environments  = jsonencode({ RDS_HOST = var.rds_host })
    installations = jsonencode(["postgresql12"])
  }
}
