variable "key_name" {
  type        = string
  description = "SSH Key Name"
}

variable "region" {
  type        = string
  description = "AWS Region"
  default     = "us-west-2"
}

variable "availability_zones" {
  type        = list(string)
  description = "Availability Zones"
  default     = ["us-west-2a", "us-west-2b"]
  validation {
    condition     = length(var.availability_zones) == 2
    error_message = "Number of availability zones should equal to 2."
  }
}