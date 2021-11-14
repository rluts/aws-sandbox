resource "aws_iam_instance_profile" "lohika_instance_profile" {
  role = aws_iam_role.lohika_iam_role.name
  name = "lohika_instance_profile"
}

resource "aws_iam_role" "lohika_iam_role" {
  name               = "lohika_iam_role"
  assume_role_policy = <<-EOF
  {
    "Version": "2012-10-17",
    "Statement": [
      {
        "Action": "sts:AssumeRole",
        "Principal": {
          "Service": "ec2.amazonaws.com"
        },
        "Effect": "Allow"
      }
    ]
  }
  EOF
}

resource "aws_iam_role_policy" "lohika_iam_role_policy" {
  role   = aws_iam_role.lohika_iam_role.id
  name   = "lohika_iam_role_policy"
  policy = <<-EOF
  {
    "Version": "2012-10-17",
    "Statement": [
      {
        "Action": [
          "s3:GetObject"
        ],
        "Effect": "Allow",
        "Resource": "*"
      },
      {
        "Effect": "Allow",
        "Action": "sqs:*",
        "Resource": "*"
      },
      {
        "Effect": "Allow",
        "Action": "sns:*",
        "Resource": "*"
      },
      {
        "Action": [
          "dynamoDb:*"
        ],
        "Effect": "Allow",
        "Resource": "*"
      }
    ]
  }
  EOF
}
