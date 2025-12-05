output "parameter_group_id" {
    description = "The ID of the RDS DB parameter group"
    value       = aws_db_parameter_group.mysql_community_pg.id
}
output "parameter_group_name" {
    description = "The name of the RDS DB parameter group"
    value       = aws_db_parameter_group.mysql_community_pg.name
}