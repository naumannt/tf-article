data "aws_acm_certificate" "example" {
  domain   = "*.example-dev.io"
  statuses = ["ISSUED"]
}