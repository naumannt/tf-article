resource "aws_security_group" "eks-alb" {
  name        = "eks-alb-public"
  description = "Security group allowing public traffic for the eks load balancer."
  vpc_id      = "${var.vpc_id}"

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = "${
    map(
     "Name", "terraform-eks-alb",
     "kubernetes.io/cluster/example", "owned",
    )
  }"
}

resource "aws_security_group_rule" "eks-alb-public-https" {
  description       = "Allow eks load balancer to communicate with public traffic securely."
  cidr_blocks       = ["0.0.0.0/0"]
  from_port         = 443
  protocol          = "tcp"
  security_group_id = "${aws_security_group.eks-alb.id}"
  to_port           = 443
  type              = "ingress"
}

resource "aws_security_group_rule" "eks-alb-public-http" {
  description       = "Allow eks load balancer to communicate with public traffic."
  cidr_blocks       = ["0.0.0.0/0"]
  from_port         = 80
  protocol          = "tcp"
  security_group_id = "${aws_security_group.eks-alb.id}"
  to_port           = 80
  type              = "ingress"
}
