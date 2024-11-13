# Salida para el ID del clúster ECS
output "ecs_cluster_id" {
  description = "El ID del clúster ECS"
  value       = aws_ecs_cluster.main.id  
}
