variable "instance_type" {
  description = "Type of EC2 instance to launch"
  type        = string
  default     = "t2.micro"
}

variable "ami_id" {
  description = "AMI ID to use for the EC2 instance"
  type        = string
  default     = "ami-0c55b159cbfafe1f0"  # Amazon Linux 2 AMI para eu-west-1
}

variable "key_name" {
  description = "The name of the key pair to allow SSH access"
  type        = string
  default     = "your-key"  # Debes reemplazar esto por tu key pair real
}

variable "associate_public_ip_address" {
  description = "Whether to associate a public IP address with the instance"
  type        = bool
  default     = true
}
variable "subnet_ids" {
  description = "List of subnet IDs to launch instances"
  type        = list(string)
}
