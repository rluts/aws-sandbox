variable "vpc" {
  description = "Main VPC"
  type        = object({ id = string, cidr_block = string })
}

variable "public_subnet_1_id" {
  description = "Public Subnet ID"
}

variable "public_subnet_2_id" {
  description = "Public Subnet ID"
}

variable "private_subnet_1_id" {
  description = "Private Subnet ID"
}

variable "instance_type" {
  type        = string
  description = "EC2 instance type"
}

variable "ami_id" {
  type        = string
  description = "EC2 AMI ID"
}

variable "nat_ami_id" {
  type        = string
  description = "EC2 AMI ID of NAT instance"
}

variable "bucket_name" {
  type        = string
  description = "S3 Bucket Name"
}

variable "calc_app_file_name" {
  type        = string
  description = "Application file name which reads messages from the SQS, log them in RDS, sends SNS notifications"
}

variable "persist_app_file_name" {
  type        = string
  description = "Application which performs calculation, writes information in Dynamo DB, sends message to SQS, sends notification via SNS"
}

variable "key_name" {
  type        = string
  description = "SSH Key Name"
}

variable "rds_host" {
  type = string
}

variable "rds_credentials" {
  type = object({ username = string, password = string })
}

variable "rds_name" {
  type = string
}