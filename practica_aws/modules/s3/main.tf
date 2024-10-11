resource "aws_s3_bucket" "nginx_logs" {
  bucket = "nginx-logs-${random_string.s3_suffix.result}"
}

resource "random_string" "s3_suffix" {
  length  = 6
  special = false
}

