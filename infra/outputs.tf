output "vpc_id" {
  value = module.vpc.vpc_id
}

output "public_subnets" {
  value = module.vpc.public_subnets
}

output "private_subnets" {
  value = module.vpc.private_subnets
}

output "db_endpoint" {
  value = aws_db_instance.postgres.endpoint
}

output "db_name" {
  value = aws_db_instance.postgres.name
}

output "db_username" {
  value = aws_db_instance.postgres.username
}

output "db_password" {
  value = aws_db_instance.postgres.password
  sensitive = true
}

output "frontend_sg_id" {
  value = aws_security_group.frontend.id
}

output "backend_sg_id" {
  value = aws_security_group.backend.id
}

output "db_sg_id" {
  value = aws_security_group.db.id
}

output "backend_instance_profile_name" {
  value = aws_iam_instance_profile.backend_instance_profile.name
}
