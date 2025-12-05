output "Frontend-Public-IP" {
  value = module.instances.frontend_instance_public_ip
}

output "Backend-Public-IP" {
  value = module.instances.backend_instance_public_ip
}

output "RDS-Endpoint" {
  value = module.RDS.RDS_Address
}
