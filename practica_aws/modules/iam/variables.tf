variable "ecs_task_role_name" {
  description = "Name of the IAM role for ECS task execution"
  type        = string
  default     = "ecsTaskExecutionRole"
}

variable "ecs_task_execution_policy_arn" {
  description = "ARN of the policy to attach to the ECS task execution role"
  type        = string
  default     = "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"
}
