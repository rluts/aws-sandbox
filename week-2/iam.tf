resource "aws_iam_role" "ec2_role" {
  name        = "ec2_role"
  assume_role_policy = file("templates/role_ec2.json")
}

resource "aws_iam_role_policy" "ec2_role_policy" {
  policy = data.template_file.s3_policy.rendered
  role   = aws_iam_role.ec2_role.id
}

resource "aws_iam_instance_profile" "ec2_iam_profile" {
  name = "ec2_iam_profile"
  role = aws_iam_role.ec2_role.name
}