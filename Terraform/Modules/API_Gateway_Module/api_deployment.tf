resource "aws_api_gateway_deployment" "deployment" {
  depends_on = [
    aws_api_gateway_integration.lambda_post_integration,  
    aws_api_gateway_integration_response.lambda_post_response,
    aws_api_gateway_method.lambda_post,
    aws_api_gateway_method_response.lambda_post,
    aws_api_gateway_integration.lambda_get_integration,
    aws_api_gateway_integration_response.lambda_get_response,
    aws_api_gateway_method.lambda_get,
    aws_api_gateway_method_response.lambda_get,
  ]

  rest_api_id = aws_api_gateway_rest_api.my_api.id
  stage_name = "dev"
}