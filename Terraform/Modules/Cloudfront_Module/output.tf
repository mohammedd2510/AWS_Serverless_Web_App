output "cloudfront_distribution_arn_output" {
    value = aws_cloudfront_distribution.cf-dist.arn
}
output "cloudfront_distribution_domain_name_output" {
    value = aws_cloudfront_distribution.cf-dist.domain_name
}
output "cloudfront_distribution_hosted_zone_id_output" {
    value = aws_cloudfront_distribution.cf-dist.hosted_zone_id
}