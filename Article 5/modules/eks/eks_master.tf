resource "aws_eks_cluster" "tf_eks" {
  name            = "example-cluster"
  role_arn        = "${aws_iam_role.tf-eks-master.arn}"
  version	  = "${var.cluster_version}"
  vpc_config {
    security_group_ids = ["${aws_security_group.tf-eks-master.id}"]
    subnet_ids = flatten(["${var.app_subnet_ids}"])

}

  depends_on = [
    "aws_iam_role_policy_attachment.tf-cluster-AmazonEKSClusterPolicy",
    "aws_iam_role_policy_attachment.tf-cluster-AmazonEKSServicePolicy",
  ]
}
