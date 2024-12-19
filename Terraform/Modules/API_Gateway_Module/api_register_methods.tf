resource "aws_api_gateway_method" "lambda_post" {
  rest_api_id = aws_api_gateway_rest_api.my_api.id
  resource_id = aws_api_gateway_resource.register.id
  http_method = "POST"
  authorization = "NONE"
}


resource "aws_api_gateway_method_response" "lambda_post" {
  rest_api_id = aws_api_gateway_rest_api.my_api.id
  resource_id = aws_api_gateway_resource.register.id
  http_method = aws_api_gateway_method.lambda_post.http_method
  status_code = "200"
  
    response_models = {
    "application/json" = "Empty"
  }

  response_parameters = {
    "method.response.header.Access-Control-Allow-Origin"  = true
  }
  }



module "cors_register" {
  source = "squidfunk/api-gateway-enable-cors/aws"
  version = "0.3.3"

  api_id          = aws_api_gateway_rest_api.my_api.id
  api_resource_id = aws_api_gateway_resource.register.id
  
}