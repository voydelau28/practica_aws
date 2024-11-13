# Salida para el ARN del Load Balancer
output "lb_arn" {
  description = "El ARN del Load Balancer existente"
  value       = data.aws_lb.kc_alb_laura.arn  # Exportar el ARN del Load Balancer existente
}

# Salida para el ARN del Target Group
output "target_group_arn" {
  description = "El ARN del target group"
  value       = aws_lb_target_group.app_tg.arn  # Exportar el ARN del target group
}
