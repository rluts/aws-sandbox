resource "aws_dynamodb_table" "dynamodb" {
  hash_key     = "UserName"
  name         = var.dynamodb_table_name
  billing_mode = "PAY_PER_REQUEST"
  attribute {
    name = "UserName"
    type = "S"
  }
}