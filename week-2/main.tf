provider "aws" {
  region = "us-west-2"
  access_key = var.access_key
  secret_key = var.secret_key
}

resource "aws_instance" "aws_week_2_instance" {
  ami = "ami-013a129d325529d4d"
  instance_type = "t2.micro"
  key_name = var.key_name
  vpc_security_group_ids = [aws_security_group.ssh_sg.id]
  user_data = data.template_file.user_data.rendered
  iam_instance_profile = aws_iam_instance_profile.ec2_iam_profile.id
}

output "ec2_public_ip" {
  value = aws_instance.aws_week_2_instance.public_ip
}
