output "frontend_instance_public_ip" {
  value = aws_instance.Frontend.public_ip
}

output "backend_instance_public_ip" {
  value = aws_instance.Backend.public_ip
}

output "frontend_instance_id" {
  value = aws_instance.Frontend.id
}

output "backend_instance_id" {
  value = aws_instance.Backend.id
}
