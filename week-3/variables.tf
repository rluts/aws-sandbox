variable "key_name" {
  type        = string
  description = "SSH Key Name"
}

variable "bucket_name" {
  type        = string
  description = "S3 Bucket Name"
}

variable "rds_credentials" {
  type        = object({ username = string, password = string })
  description = "RDS Credentials"
}