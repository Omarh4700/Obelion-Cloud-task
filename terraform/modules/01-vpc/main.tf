resource "aws_vpc" "Obelion-Cloud-app_VPC" {
  cidr_block           = var.vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = {
    Name = "Obelion-Cloud-app_VPC"
  }

}
resource "aws_internet_gateway" "Obelion-Cloud_IGW" {
  vpc_id = aws_vpc.Obelion-Cloud-app_VPC.id
  tags = {
    Name = "Obelion-Cloud_IGW"
  }
}
