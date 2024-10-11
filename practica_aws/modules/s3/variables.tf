variable "bucket_prefix" {
  description = "Prefix for the S3 bucket name"
  type        = string
  default     = "nginx-logs"
}

variable "random_suffix_length" {
  description = "Length of the random string appended to the S3 bucket name"
  type        = number
  default     = 6
}
