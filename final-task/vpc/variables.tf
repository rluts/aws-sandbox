variable "availability_zones" {
  type        = list(string)
  description = "Availability Zones"
  validation {
    condition     = length(var.availability_zones) == 4
    error_message = "Number of availability zones should equal to 4."
  }
}

variable "nat_server_id" {
  type = string
}
