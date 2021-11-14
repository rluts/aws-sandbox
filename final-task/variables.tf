variable "region" {
  type        = string
  description = "AWS Region"
  default     = "us-west-2"
}

variable "availability_zones" {
  type        = list(string)
  description = "Availability Zones"
  default     = ["us-west-2a", "us-west-2b", "us-west-2c", "us-west-2d"]
  validation {
    condition     = length(var.availability_zones) == 4
    error_message = "Number of availability zones should equal to 4."
  }
}

variable "key_name" {
  type        = string
  description = "SSH Key Name"
}

variable "instance_type" {
  type        = string
  description = "EC2 instance type"
  default     = "t2.micro"
}

variable "ami_id" {
  type        = string
  description = "EC2 AMI ID"
  default     = "ami-013a129d325529d4d"
}

variable "nat_ami_id" {
  type    = string
  default = "ami-013a129d325529d4d"
}

variable "bucket_name" {
  type        = string
  description = "S3 Bucket Name"
}

variable "rds_credentials" {
  type = object({ username = string, password = string })
}

variable "calc_app_file_name" {
  type        = string
  description = "Application file name which reads messages from the SQS, log them in RDS, sends SNS notifications"
  default     = "calc-0.0.2-SNAPSHOT.jar"
}

variable "persist_app_file_name" {
  type        = string
  description = "Application which performs calculation, writes information in Dynamo DB, sends message to SQS, sends notification via SNS"
  default     = "persist3-0.0.1-SNAPSHOT.jar"
}

variable "sns_topic_name" {
  type    = string
  default = "edu-lohika-training-aws-sns-topic"
}

variable "sqs_queue_name" {
  type    = string
  default = "edu-lohika-training-aws-sqs-queue"
}

variable "dynamodb_table_name" {
  type    = string
  default = "edu-lohika-training-aws-dynamodb"
}

variable "rds_name" {
  type    = string
  default = "EduLohikaTrainingAwsRds"
}