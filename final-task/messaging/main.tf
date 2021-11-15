resource "aws_sns_topic" "lohika_sns_topic" {
  name = var.sns_topic_name
}

resource "aws_sqs_queue" "lohika_sqs_queue" {
  name = var.sqs_queue_name
}