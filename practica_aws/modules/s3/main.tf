resource "aws_s3_bucket" "bucket" {
  bucket = var.bucket_name

  
  tags = {
    Name = var.tag_name  
  }

}

resource "aws_s3_bucket_policy" "bucket_policy" {
  bucket = aws_s3_bucket.bucket.id
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          AWS = "arn:aws:iam::921108067704:user/voydelau28"  
        }
        Action = "s3:GetObject"
        Resource = "${aws_s3_bucket.bucket.arn}/*"
      }
    ]
  })
}
