output "vpc_id" {
  value = aws_vpc.main.id
}

output "public_subnet_id" {
  value = aws_subnet.public.id
}

output "private_subnet_id" {
  value = aws_subnet.private.id
}

output "security_group_id" {
  value = aws_security_group.allow_http.id
}

output "ecr_repository_url" {
  value = aws_ecr_repository.hello_world.repository_url
}

output "ecs_cluster_name" {
  value = aws_ecs_cluster.hello_world.name
}

output "ecs_task_definition_arn" {
  value = aws_ecs_task_definition.hello_world.arn
}

output "ecs_service_name" {
  value = aws_ecs_service.hello_world.name
}
