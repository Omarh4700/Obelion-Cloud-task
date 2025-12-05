output "public_subnets_A_id" {
  value = aws_subnet.public_A.id
}
output "public_subnets_B_id" {
  value = aws_subnet.public_B.id
}
output "private_subnets_A_id" {
  value = aws_subnet.private_A.id
}
output "private_subnets_B_id" {
  value = aws_subnet.private_B.id
}
