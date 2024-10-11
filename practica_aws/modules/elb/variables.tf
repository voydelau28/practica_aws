variable "vpc_id" {
  description = "vpc-08bffd360b72f38d5"
  type        = string
}

variable "subnet_ids" {
  description = "The subnet IDs where the ELB will be created"
  type        = list(string)
}

variable "security_group_id" {
  description = "sg-05cb0048d2ffc49f7"
  type        = string
}
