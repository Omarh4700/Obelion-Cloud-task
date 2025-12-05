resource "aws_db_parameter_group" "mysql_community_pg" {
  description = "mysql-community-parameter-group for MySQL 8.0"
  name        = var.RDS_parameter_group_name   # Name of the DB parameter group
  family      = var.RDS_parameter_group_family # Parameter group family for MySQL Community Edition

  tags = {
    Name = var.RDS_parameter_group_name
    Type = "DB-Parameter-Group"
  }
}
