resource "aws_acm_certificate" "nasum" {
  domain_name              = data.aws_route53_zone.nasum.name
  subject_alternative_names = []
  validation_method        = "DNS"
}
