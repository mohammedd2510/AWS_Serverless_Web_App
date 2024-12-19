resource "aws_dynamodb_table" "dynamodb-table" {
  name         = "registration-table"
  billing_mode = "PAY_PER_REQUEST"
  point_in_time_recovery {
    enabled = true
  }
  server_side_encryption {
    enabled         = true
  }
  attribute {
    name = "email"
    type = "S"
  }

  hash_key  = "email"
}