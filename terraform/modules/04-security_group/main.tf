#===============================
# Security Group Frontend
#===============================
resource "aws_security_group" "frontend_sg" {
  name        = "frontend_sg"
  description = "Security Group for Frontend"
  vpc_id      = var.vpc_id
}
#-------------------------------
# Frontend Security Group Role
#-------------------------------
resource "aws_security_group_rule" "frontend_ingress_http" {
  type              = "ingress"
  description       = "Allow inbound HTTP traffic from anywhere"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.frontend_sg.id
}
# allow ssh
resource "aws_security_group_rule" "frontend_ingress_ssh" {
  type              = "ingress"
  description       = "Allow inbound SSH traffic from anywhere"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.frontend_sg.id
}

resource "aws_security_group_rule" "frontend_egress_http" {
  type              = "egress"
  description       = "Allow outbound traffic to anywhere"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.frontend_sg.id
}

#===============================
# Security Group Backend
#===============================
resource "aws_security_group" "backend_sg" {
  name        = "backend_sg"
  description = "Security Group for Backend"
  vpc_id      = var.vpc_id
}

#------------------------------
# Backend Security Group Role
#------------------------------
resource "aws_security_group_rule" "backend_ingress_http" {
  type                     = "ingress"
  description              = "Allow inbound HTTP traffic from Frontend Security Group"
  from_port                = 80
  to_port                  = 80
  protocol                 = "tcp"
  security_group_id        = aws_security_group.backend_sg.id
  source_security_group_id = aws_security_group.frontend_sg.id
}
# allow ssh
resource "aws_security_group_rule" "backend_ingress_ssh" {
  type              = "ingress"
  description       = "Allow inbound SSH traffic from anywhere"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.backend_sg.id
}
resource "aws_security_group_rule" "backend_egress_http" {
  type              = "egress"
  description       = "Allow outbound traffic to anywhere"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.backend_sg.id
}

resource "aws_security_group_rule" "backend_to_database" {
  type                     = "egress"
  description              = "Allow outbound MySQL traffic from backend to Database Security Group"
  from_port                = 3306
  to_port                  = 3306
  protocol                 = "tcp"
  security_group_id        = aws_security_group.backend_sg.id
  source_security_group_id = aws_security_group.database_sg.id
}

#===============================
# Security Group Database
#===============================
resource "aws_security_group" "database_sg" {
  name        = "database_sg"
  description = "Security Group for Database"
  vpc_id      = var.vpc_id
}

resource "aws_security_group_rule" "allow_traffic_from_the_backend" {
  type                     = "ingress"
  description              = "Allow inbound MySQL traffic from Backend Security Group"
  from_port                = 3306
  to_port                  = 3306
  protocol                 = "tcp"
  security_group_id        = aws_security_group.database_sg.id
  source_security_group_id = aws_security_group.backend_sg.id
}

