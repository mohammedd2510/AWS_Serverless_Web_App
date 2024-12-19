resource "aws_api_gateway_integration" "lambda_get_integration" {
  rest_api_id = aws_api_gateway_rest_api.my_api.id
  resource_id = aws_api_gateway_resource.users.id
  http_method = aws_api_gateway_method.lambda_get.http_method
  integration_http_method = "GET"
  type = "AWS"
  uri = var.aws_lambda_get_invoke_arn

}


resource "aws_api_gateway_integration_response" "lambda_get_response" {
  rest_api_id = aws_api_gateway_rest_api.my_api.id
  resource_id = aws_api_gateway_resource.users.id
  http_method = aws_api_gateway_method.lambda_get.http_method
  status_code = aws_api_gateway_method_response.lambda_get.status_code


  depends_on = [
    aws_api_gateway_method.lambda_get,
    aws_api_gateway_integration.lambda_get_integration
  ]
}

