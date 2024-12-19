data "archive_file" "lambda_post_package" {
  type = "zip"

  source_file = "../Lambda_Backend_Functions/lambda_POST.py"
  output_path = "lambda_post.zip"
}
data "archive_file" "lambda_get_package" {
  type = "zip"

  source_file = "../Lambda_Backend_Functions/lambda_GET.py"
  output_path = "lambda_get.zip"
}
resource "aws_lambda_function" "backend_lambda_post" {
  filename = "lambda_post.zip"
  function_name = "BackendLambdaFunctionPOST"
  role = aws_iam_role.lambda_role.arn
  handler = "lambda_POST.lambda_handler"
  runtime = "python3.9"
  source_code_hash = data.archive_file.lambda_post_package.output_base64sha256
}
resource "aws_lambda_function" "backend_lambda_get" {
  filename = "lambda_get.zip"
  function_name = "BackendLambdaFunctionGET"
  role = aws_iam_role.lambda_role.arn
  handler = "lambda_GET.lambda_handler"
  runtime = "python3.9"
  source_code_hash = data.archive_file.lambda_get_package.output_base64sha256
}