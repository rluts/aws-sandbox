resource "aws_sns_topic" "week5_sns_topic" {
  name = var.sns_topic_name
}

resource "aws_sqs_queue" "week5_sqs_queue" {
  name = var.sqs_queue_name
}