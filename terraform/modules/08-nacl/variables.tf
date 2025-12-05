variable "vpc_id" {
  description = "The ID of the VPC"
  type        = string
}

variable "public_subnet_ids" {
  description = "List of Public Subnet IDs"
  type        = list(string)
}

variable "private_subnet_ids" {
  description = "List of Private Subnet IDs"
  type        = list(string)
}
