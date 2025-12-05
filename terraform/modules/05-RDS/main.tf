resource "aws_db_instance" "mysql_DB" {
  identifier             = var.db_identifier
  allocated_storage      = var.db_allocated_storage
  storage_type           = var.db_storage_type
  engine                 = var.db_engine
  engine_version         = var.db_engine_version
  instance_class         = var.db_instance_class
  db_name                = var.initial_db_name
  username               = var.db_username
  password               = var.db_password
  vpc_security_group_ids = [var.rds_sg_id]
  db_subnet_group_name   = var.RDS_subnet_group_name # Associate with a DB subnet group for custom VPC
  multi_az               = false                     # Single-AZ deployment
  publicly_accessible    = false
  skip_final_snapshot    = true
  tags = {
    Name = var.db_identifier
    Type = "RDS-Instance"
  }
}
