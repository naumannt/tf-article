########################################################################################
# setup provider for kubernetes

data "aws_eks_cluster_auth" "tf_eks" {
  name = "${aws_eks_cluster.tf_eks.name}"
}


provider "kubernetes" {
  host                      = "${aws_eks_cluster.tf_eks.endpoint}"
  cluster_ca_certificate    = "${base64decode(aws_eks_cluster.tf_eks.certificate_authority.0.data)}"
  token                     = "${data.aws_eks_cluster_auth.tf_eks.token}"
  load_config_file          = false
  version = "~> 1.5"
}

# Allow worker nodes to join cluster via config map
resource "kubernetes_config_map" "aws_auth" {
  metadata {
    name = "aws-auth"
    namespace = "kube-system"
  }
  data = {
    mapRoles = <<EOF
- rolearn: ${aws_iam_role.tf-eks-node.arn}
  username: system:node:{{EC2PrivateDNSName}}
  groups:
    - system:bootstrappers
    - system:nodes
EOF
  }
  depends_on = [
    "aws_eks_cluster.tf_eks","aws_autoscaling_group.tf_eks"]
}
