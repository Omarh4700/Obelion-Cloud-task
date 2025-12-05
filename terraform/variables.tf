variable "region" {
  description = "The region to use for the AWS provider"
  type        = string
  default     = "eu-west-1"
}

variable "alert_email" {
  description = "Email for alerts"
  type        = string
  default     = "hassanomar4700@gmail.com"
}
