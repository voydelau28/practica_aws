variable "vpc_id" {
  description = "ID de la VPC donde se encuentra el Load Balancer"
  type        = string
}

variable "subnet_ids" {
  description = "The subnet IDs where the ELB will be created"
  type        = list(string)
}

variable "security_group_id" {
  description = "ID del grupo de seguridad para el Load Balancer"
  type        = string
}
