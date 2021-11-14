resource "aws_iam_instance_profile" "week5_instance_profile" {
  name = "week5_instance_profile"
  role = aws_iam_role.week5_iam_role.name
}

resource "aws_iam_role" "week5_iam_role" {
  name               = "week5_iam_role"
  assume_role_policy = file("policies/ec2_role.json")
}

resource "aws_iam_role_policy" "week5_sqs_sns_policy" {
  name   = "week5_sqs_sns_policy"
  role   = aws_iam_role.week5_iam_role.id
  policy = file("policies/messaging_policy.json")
}

