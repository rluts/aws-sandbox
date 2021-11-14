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