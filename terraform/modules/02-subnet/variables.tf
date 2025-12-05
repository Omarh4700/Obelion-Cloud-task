variable "vpc_id" {
  description = "The VPC ID"
  type        = string
}

variable "public_subnets_cidr_A" {
  description = "Public Subnets CIDR A"
  type        = string
  default     = "10.0.1.0/24"
}

variable "public_subnets_cidr_B" {
  description = "Public Subnets CIDR B"
  type        = string
  default     = "10.0.2.0/24"
}

variable "private_subnets_cidr_A" {
  description = "Private Subnets CIDR A"
  type        = string
  default     = "10.0.3.0/24"
}

variable "private_subnets_cidr_B" {
  description = "Private Subnets CIDR B"
  type        = string
  default     = "10.0.4.0/24"
}

variable "availability_zone_A" {
  description = "Availability Zone A"
  type        = string
  default     = "eu-west-1a"
}

variable "availability_zone_B" {
  description = "Availability Zone B"
  type        = string
  default     = "eu-west-1b"
}
