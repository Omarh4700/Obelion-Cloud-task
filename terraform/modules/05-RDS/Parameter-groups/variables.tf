variable "RDS_parameter_group_name" {
  description = "The name of the DB parameter group"
  default     = "mysql-community-pg"
  type        = string
}
variable "RDS_parameter_group_family" {
  description = "The family of the DB parameter group"
  default     = "mysql8.0"
  type        = string
}
