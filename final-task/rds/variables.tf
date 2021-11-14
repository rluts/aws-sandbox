variable "vpc" {
  type = object({ cidr_block = string, id = string })
}

variable "rds_credentials" {
  type = object({ username = string, password = string })
}

variable "subnets_ids" {
  type = list(string)
}

variable "rds_name" {
  type = string
}