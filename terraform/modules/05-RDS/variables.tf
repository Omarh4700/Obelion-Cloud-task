variable "vpc_id" {
  description = "The ID of the VPC where the ElastiCache cluster will be deployed"
  type        = string
}
variable "db_engine" {
  description = "The database engine to use"
  default     = "mysql"
  type        = string
}
variable "db_engine_version" {
  description = "The version of the database engine"
  default     = "8.0.43"
  type        = string
}
variable "db_instance_class" {
  description = "The instance class for the RDS instance"
  default     = "db.t3.micro"
  type        = string
}
variable "db_identifier" {
  description = "The identifier for the RDS instance"
  default     = "obelion-cloud-rds"
  type        = string
}
variable "initial_db_name" {
  description = "The name of the database"
  default     = "accounts"
  type        = string
}
variable "db_username" {
  description = "The master username for the database"
  default     = "admin"
  type        = string
}
variable "db_password" {
  description = "The master password for the database"
  default     = "admin123"
  type        = string
  sensitive   = true
}
variable "db_allocated_storage" {
  description = "The allocated storage in GB for the RDS instance"
  default     = 20
  type        = number
}
variable "db_storage_type" {
  description = "The storage type for the RDS instance"
  default     = "gp3"
  type        = string
}
variable "rds_sg_id" {
  description = "The security group ID for the RDS instance"
  type        = string
}
variable "RDS_subnet_group_name" {
  description = "The name of the RDS DB subnet group"
  type        = string
}
variable "RDS_parameter_group_name" {
  description = "The name of the RDS DB parameter group"
  type        = string
}
