variable "ami" {
  description = "The AMI ID to use for the instance"
  default     = "ami-049442a6cf8319180"
  type        = string
}
variable "instance_type" {
  description = "The instance type to use for the instance"
  default     = "t2.micro"
  type        = string
}
variable "public_subnet_A_id" {
  description = "The ID of the public subnet A"
  type        = string
}
variable "public_subnet_B_id" {
  description = "The ID of the public subnet B"
  type        = string
}
variable "frontend_sg_id" {
  description = "The security group ID for the frontend instance"
  type        = string
}
variable "backend_sg_id" {
  description = "The security group ID for the backend instance"
  type        = string
}
