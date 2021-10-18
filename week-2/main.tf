provider "aws" {
  region = "us-west-2"
  access_key = var.access_key
  secret_key = var.secret_key
}

variable "access_key" {
  type = string
  description = "AWS Access Key"
}

variable "secret_key" {
  type = string
  description = "AWS Access Key"
}

variable "key_name" {
  type = string
  description = "SSH Key Name"
}

variable "bucket_name" {
  type = string
  description = "S3 Bucket Name"
}

resource "aws_security_group" "ssh_sg" {
  name = "ssh_sg"

  ingress {
    from_port = 22
    protocol  = "tcp"
    to_port   = 22
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port = 0
    protocol  = -1
    to_port   = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_iam_role" "ec2_role" {
  name        = "ec2_role"
  assume_role_policy = file("role_ec2.json")
}

resource "aws_iam_role_policy" "ec2_role_policy" {
  policy = file("policy_s3_bucket.json")
  role   = aws_iam_role.ec2_role.id
}

resource "aws_iam_instance_profile" "ec2_iam_profile" {
  name = "ec2_iam_profile"
  role = aws_iam_role.ec2_role.name
}

resource "aws_instance" "aws-week-2-instance" {
  ami = "ami-013a129d325529d4d"
  instance_type = "t2.micro"
  key_name = var.key_name
  vpc_security_group_ids = [aws_security_group.ssh_sg.id]
  user_data = file("user-data.sh")
  iam_instance_profile = aws_iam_instance_profile.ec2_iam_profile.id
}

output "ec2_public_ip" {
  value = aws_instance.aws-week-2-instance.public_ip
}
