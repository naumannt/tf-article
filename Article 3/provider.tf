provider "aws" {
 region  = "${var.aws_region}"
 version = "~> 1.55.0"
 access_key = "${var.aws_access_key}"
 secret_key = "${var.aws_secret_key}"
}