resource "aws_route53_zone" "zone" {
  name = "atlschoolproject.live"
}

resource "aws_route53_record" "terraform-test" {
  zone_id = aws_route53_zone.zone.zone_id
  name    = "terraform-test"
  type    = "A"

  alias {
    name                   = aws_lb.alb.dns_name
    zone_id                = aws_lb.alb.zone_id
    evaluate_target_health = true
  }
}
