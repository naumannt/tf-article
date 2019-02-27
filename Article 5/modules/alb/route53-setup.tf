resource "aws_route53_record" "example" {
  zone_id = "${var.hosted_zone_id}"
  name    = "*.api.${var.hosted_zone_url}"
  type    = "A"
  alias {
    name                   = "${aws_alb.eks-alb.dns_name}"
    zone_id                = "${aws_alb.eks-alb.zone_id}"
    evaluate_target_health = false
  }
}