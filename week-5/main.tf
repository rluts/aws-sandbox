provider "aws" {
  region = "us-west-2"
}

resource "aws_sns_topic" "week5_sns_topic" {
  name = "week5_sns_topic"
}

resource "aws_sqs_queue" "week5_sqs_queue" {
  name = "week5_sqs_queue"
}

resource "aws_instance" "week5_ec2_instance" {
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name      = var.key_name
  tags = {
    Name = "week5_ec2_instance"
  }

  security_groups = [
    aws_security_group.ingress_ssh.name,
    aws_security_group.ingress_http_https.name,
    aws_security_group.egress_all.name,
  ]

  iam_instance_profile = aws_iam_instance_profile.week5_instance_profile.name
}
