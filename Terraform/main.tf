module "API_Gateway_Module" {
    source = "./Modules/API_Gateway_Module"
    aws_lambda_post_invoke_arn = module.Lambda_Module.lambda_post_invoke_arn
    aws_lambda_get_invoke_arn = module.Lambda_Module.lambda_get_invoke_arn
    acm_arn = module.ACM_Module.acm_arn_output
    my_domain_hostedzone_id = module.route53_Module.domain_hostedzone_id
  
}
module "Lambda_Module" {
    source = "./Modules/Lambda_Module"
    api_gateway_execution_arn = module.API_Gateway_Module.api_execution_arn
  
}
module "dynamodb_module" {
    source = "./Modules/DynamoDB_Module"
  
}
module "route53_Module" {
    source = "./Modules/Route53_Module"
    api_gateway_domain_name = module.API_Gateway_Module.api_gateway_domain_name_output
    cloudfront_distribution_domain_name = module.Cloudfront_Module.cloudfront_distribution_domain_name_output
    cloudfront_distribution_hostedzone_id = module.Cloudfront_Module.cloudfront_distribution_hosted_zone_id_output

  
}
module "ACM_Module" {
  source = "./Modules/ACM_Module"
  my_domain_hostedzone_id = module.route53_Module.domain_hostedzone_id
}
module "S3_Module" {
    source = "./Modules/S3_Module"
    cloudfront_distribution_arn = module.Cloudfront_Module.cloudfront_distribution_arn_output
}
module "Cloudfront_Module" {
    source = "./Modules/Cloudfront_Module"
    s3_bucket_id = module.S3_Module.s3_bucket_id_output
    acm_arn = module.ACM_Module.acm_arn_output
  
}