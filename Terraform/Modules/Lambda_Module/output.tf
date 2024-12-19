output "lambda_post_invoke_arn" {
  value = aws_lambda_function.backend_lambda_post.invoke_arn
}
output "lambda_get_invoke_arn" {
  value = aws_lambda_function.backend_lambda_get.invoke_arn
}