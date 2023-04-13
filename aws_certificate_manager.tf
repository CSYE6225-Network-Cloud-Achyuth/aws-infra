# resource "aws_acm_certificate" "ssl_certificate" {


#   domain_name       = "dev.achyuthvarma.me"
#   validation_method = "DNS"
#   key_algorithm     = "RSA_2048"

#   tags = {
#     "profile" = var.profile
#   }

#   lifecycle {
#     create_before_destroy = true
#   }
# }

data "aws_acm_certificate" "latest_certificate" {
  domain      = var.route53_record_name
  statuses    = ["ISSUED"]
  most_recent = true
}
