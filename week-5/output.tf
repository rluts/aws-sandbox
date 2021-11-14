output "ec2_public_ip" {
  value = aws_instance.week5_ec2_instance.public_ip
}

output "sns_topic_arn" {
  value = aws_sns_topic.week5_sns_topic.arn
}

output "sqs_queue_url" {
  value = aws_sqs_queue.week5_sqs_queue.id
}
