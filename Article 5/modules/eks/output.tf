output "eks_kubeconfig" {
  value = "${local.kubeconfig}"
  depends_on = [
    "aws_eks_cluster.tf_eks."
  ]
}

output "target_group_arn" {
  value = "${aws_lb_target_group.tf_eks.arn}"
}

output "node_sg_id" {
  value = "${aws_security_group.tf-eks-node.id}"
}
