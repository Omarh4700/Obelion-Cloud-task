# Create the public subnet A
resource "aws_subnet" "public_A" {
  vpc_id                  = var.vpc_id
  cidr_block              = var.public_subnets_cidr_A
  map_public_ip_on_launch = true
  availability_zone       = var.availability_zone_A
  tags = {
    Name = "public-subnet-A"
  }
}

# Create the public subnet B
resource "aws_subnet" "public_B" {
  vpc_id                  = var.vpc_id
  cidr_block              = var.public_subnets_cidr_B
  map_public_ip_on_launch = true
  availability_zone       = var.availability_zone_B
  tags = {
    Name = "public-subnet-B"
  }
}

# Create the private subnet A
resource "aws_subnet" "private_A" {
  vpc_id            = var.vpc_id
  cidr_block        = var.private_subnets_cidr_A
  availability_zone = var.availability_zone_A
  tags = {
    Name = "private-subnet-A"
  }
}

# Create the private subnet B
resource "aws_subnet" "private_B" {
  vpc_id            = var.vpc_id
  cidr_block        = var.private_subnets_cidr_B
  availability_zone = var.availability_zone_B
  tags = {
    Name = "private-subnet-B"
  }
}
