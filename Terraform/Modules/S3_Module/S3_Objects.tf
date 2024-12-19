# Upload files to S3 Bucket
resource "aws_s3_object" "provision_source_files" {
  bucket = aws_s3_bucket.my_bucket.id

  # Frontend/ is the Directory contains files to be uploaded to S3
  for_each = fileset("../Frontend/", "**/*.*")

  key           = each.value
  source        = "../Frontend/${each.value}"
  content_type  = each.value
}
