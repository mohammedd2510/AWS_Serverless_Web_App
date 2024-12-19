resource "aws_api_gateway_integration" "lambda_post_integration" {
  rest_api_id = aws_api_gateway_rest_api.my_api.id
  resource_id = aws_api_gateway_resource.register.id
  http_method = aws_api_gateway_method.lambda_post.http_method
  integration_http_method = "POST"
  type = "AWS"
  uri = var.aws_lambda_post_invoke_arn
}


resource "aws_api_gateway_integration_response" "lambda_post_response" {
  rest_api_id = aws_api_gateway_rest_api.my_api.id
  resource_id = aws_api_gateway_resource.register.id
  http_method = aws_api_gateway_method.lambda_post.http_method
  status_code = aws_api_gateway_method_response.lambda_post.status_code

    //cors
  response_parameters = {
    "method.response.header.Access-Control-Allow-Origin"  = "'*'"
  }

  depends_on = [
    aws_api_gateway_method.lambda_post,
    aws_api_gateway_integration.lambda_post_integration
  ]
}


