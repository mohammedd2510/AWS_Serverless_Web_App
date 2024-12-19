data "aws_route53_zone" "my_domain" {
  name = "osama-serverless.online"
  private_zone = false
}


resource "aws_route53_record" "custom_domain_record" {
  name = "api" # The subdomain (api.sumeet.life)
  type = "CNAME"
  ttl = "300" # TTL in seconds

  records = ["${var.api_gateway_domain_name}"]

  zone_id = data.aws_route53_zone.my_domain.zone_id
}

resource "aws_route53_record" "cloudfront_domain_record" {
  name = "www"
  type = "A"
  zone_id = data.aws_route53_zone.my_domain.zone_id
 alias {
    name                   = var.cloudfront_distribution_domain_name
    zone_id                = var.cloudfront_distribution_hostedzone_id
    evaluate_target_health = true
  }
  
}