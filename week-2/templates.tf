data "template_file" "user_data" {
  template = file("user-data.tpl")
  vars = {
    bucket_name = var.bucket_name
  }
}

data "template_file" "s3_policy" {
  template = file("policy_s3_bucket.tpl")
  vars = {
    bucket_name = var.bucket_name
  }
}