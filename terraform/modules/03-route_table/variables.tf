variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

variable "igw_id" {
  description = "IGW ID"
  type        = string
}

variable "public_subnets_A" {
  description = "Public Subnets A"
  type        = string
}

variable "public_subnets_B" {
  description = "Public Subnets B"
  type        = string
}

variable "private_subnets_A" {
  description = "Private Subnets A"
  type        = string
}

variable "private_subnets_B" {
  description = "Private Subnets B"
  type        = string
}
