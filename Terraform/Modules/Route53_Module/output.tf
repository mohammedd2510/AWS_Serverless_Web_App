output "domain_hostedzone_id" {
  value = data.aws_route53_zone.my_domain.zone_id
}
