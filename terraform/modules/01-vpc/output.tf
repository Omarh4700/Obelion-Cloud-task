output "vpc_id" {
  value = aws_vpc.Obelion-Cloud-app_VPC.id
}
output "igw_id" {
  value = aws_internet_gateway.Obelion-Cloud_IGW.id
}
