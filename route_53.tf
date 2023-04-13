data "aws_route53_zone" "selected" {
  name = var.route53_record_name
}

resource "aws_route53_record" "myrecord" {
  # depends_on = [
  #   aws_instance.webapp-instance
  # ]
  name    = var.route53_record_name
  zone_id = data.aws_route53_zone.selected.zone_id
  # zone_id = var.route53_zone_id
  type = "A"

  # records = [aws_instance.webapp-instance.public_ip]

  # ttl  = 60
  alias {
    name                   = aws_lb.load_balancer.dns_name
    zone_id                = aws_lb.load_balancer.zone_id
    evaluate_target_health = true
  }
}

# resource "aws_route53_record" "cname_record" {
#   # for_each = {
#   #   for dvo in data.aws_acm_certificate.latest_certificate.domain_validation_options : dvo.domain_name => {
#   #     name   = dvo.resource_record_name
#   #     record = dvo.resource_record_value
#   #     type   = dvo.resource_record_type
#   #   }
#   # }


#   allow_overwrite = true
#   name            = data.aws_acm_certificate.latest_certificate.certificate\
#   records         = data.aws_acm_certificate.latest_certificate.
#   ttl             = 60
#   type            = each.value.type
#   zone_id         = data.aws_route53_zone.selected.zone_id
# }

