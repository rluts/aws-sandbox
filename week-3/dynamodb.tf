resource "aws_dynamodb_table" "dynamodb" {
  hash_key     = "ID"
  name         = "aws_course_week3"
  billing_mode = "PAY_PER_REQUEST"
  attribute {
    name = "ID"
    type = "S"
  }
}