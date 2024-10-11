output "iam_role" {
  description = "IAM Role for ECS Task Execution"
  value       = aws_iam_role.ecs_task_role.name
}
