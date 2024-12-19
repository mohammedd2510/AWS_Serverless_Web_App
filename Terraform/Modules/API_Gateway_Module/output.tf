output "api_execution_arn" {
  value = aws_api_gateway_rest_api.my_api.execution_arn
}
output "api_gateway_domain_name_output" {
    value = aws_api_gateway_domain_name.api_gateway_domain.regional_domain_name
}