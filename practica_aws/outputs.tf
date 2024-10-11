output "ec2_public_ip" {
  description = "Public IP of the EC2 instance"
  value       = module.ec2.public_ip
}

output "elb_arn" {
  description = "ARN of the load balancer"
  value       = module.elb.elb_arn
}

