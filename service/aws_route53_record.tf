resource "aws_route53_record" "nasum" {
  zone_id = data.aws_route53_zone.nasum.zone_id
  name    = data.aws_route53_zone.nasum.name
  type    = "A"

  alias {
    name                   = aws_lb.lb.dns_name
    zone_id                = aws_lb.lb.zone_id
    evaluate_target_health = true
  }
}

resource "aws_route53_record" "nasum_certificate" {
  zone_id = data.aws_route53_zone.nasum.id
  name    = aws_acm_certificate.nasum.domain_validation_options[0].resource_record_name
  type    = aws_acm_certificate.nasum.domain_validation_options[0].resource_record_type
  records = [
    aws_acm_certificate.nasum.domain_validation_options[0].resource_record_value
  ]
  ttl = 60
}
