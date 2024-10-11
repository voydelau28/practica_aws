output "elb_arn" {
  description = "ARN of the load balancer"
  value       = aws_lb.nginx_lb.arn
}
