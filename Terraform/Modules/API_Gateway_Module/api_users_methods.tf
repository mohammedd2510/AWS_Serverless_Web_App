resource "aws_api_gateway_method" "lambda_get" {
  rest_api_id = aws_api_gateway_rest_api.my_api.id
  resource_id = aws_api_gateway_resource.users.id
  http_method = "GET"
  authorization = "NONE"
}


resource "aws_api_gateway_method_response" "lambda_get" {
  rest_api_id = aws_api_gateway_rest_api.my_api.id
  resource_id = aws_api_gateway_resource.users.id
  http_method = aws_api_gateway_method.lambda_get.http_method
  status_code = "200"

    response_models = {
    "application/json" = "Empty"
  }

  response_parameters = {
    "method.response.header.Access-Control-Allow-Origin"  = true
  }
  }

module "cors_users" {
  source = "squidfunk/api-gateway-enable-cors/aws"
  version = "0.3.3"

  api_id          = aws_api_gateway_rest_api.my_api.id
  api_resource_id = aws_api_gateway_resource.users.id
  
}