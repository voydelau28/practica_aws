variable "aws_region" {
  description = "The AWS region to create resources in."
  default     = "eu-west-1"
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  default     = "10.0.0.0/16"
}

variable "public_subnet_a_cidr" {
  description = "CIDR block for the public subnet in availability zone A"
  default     = "10.0.3.0/24"
}

variable "public_subnet_b_cidr" {
  description = "CIDR block for the public subnet in availability zone B"
  default     = "10.0.2.0/24"
}

variable "availability_zone_a" {
  description = "Availability Zone A for the first subnet"
  default     = "eu-west-1a"
}

variable "availability_zone_b" {
  description = "Availability Zone B for the second subnet"
  default     = "eu-west-1b"
}
