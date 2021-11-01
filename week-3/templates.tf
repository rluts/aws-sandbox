data "template_file" "user_data" {
  template = file("templates/user-data.tpl")
  vars = {
    bucket_name = var.bucket_name
  }
}

data "template_file" "s3_policy" {
  template = file("templates/policy_s3_bucket.tpl")
  vars = {
    bucket_name = var.bucket_name
  }
}

data "template_file" "dynamodb_policy" {
  template = file("templates/policy_dynamodb.tpl")
  vars = {
    dynamodb_arn   = aws_dynamodb_table.dynamodb.arn
    account_number = data.aws_caller_identity.current.account_id
  }
}