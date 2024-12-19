resource "aws_s3_bucket" "my_bucket" {
  bucket = "serverless-frontend-project"
  force_destroy = true
  
}
resource "aws_s3_bucket_cors_configuration" "example" {
  bucket = aws_s3_bucket.my_bucket.id

  cors_rule {
    allowed_headers = ["*"]
    allowed_methods = ["GET", "POST", "PUT", "DELETE", "HEAD"]
    allowed_origins = ["*"]
    expose_headers  = ["ETag"]
    max_age_seconds = 3000
  }
}