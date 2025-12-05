# Create Route Table >> Public Subnets
resource "aws_route_table" "public_rt" {
  vpc_id = var.vpc_id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = var.igw_id
  }
  tags = {
    Name = "public_route_table"
  }
}

resource "aws_route_table_association" "public_rt_association_A" {
  subnet_id      = var.public_subnets_A
  route_table_id = aws_route_table.public_rt.id
}
resource "aws_route_table_association" "public_rt_association_B" {
  subnet_id      = var.public_subnets_B
  route_table_id = aws_route_table.public_rt.id
}


# Create Route Table >> Private Subnets
resource "aws_route_table" "private_rt" {
  vpc_id = var.vpc_id
  tags = {
    Name = "private_route_table"
  }
}

resource "aws_route_table_association" "private_rt_association_A" {
  subnet_id      = var.private_subnets_A
  route_table_id = aws_route_table.private_rt.id
}

resource "aws_route_table_association" "private_rt_association_B" {
  subnet_id      = var.private_subnets_B
  route_table_id = aws_route_table.private_rt.id
}
