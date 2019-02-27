# generate KUBECONFIG as output to save in ~/.kube/config locally
# save the 'terraform output eks_kubeconfig > config', run 'mv config ~/.kube/config' to use it for kubectl
locals {
  kubeconfig = <<KUBECONFIG


apiVersion: v1
clusters:
- cluster:
    server: ${aws_eks_cluster.tf_eks.endpoint}
    certificate-authority-data: ${aws_eks_cluster.tf_eks.certificate_authority.0.data}
  name: kubernetes
contexts:
- context:
    cluster: kubernetes
    user: aws
  name: aws
current-context: aws
kind: Config
preferences: {}
users:
- name: aws
  user:
    exec:
      apiVersion: client.authentication.k8s.io/v1alpha1
      command: aws-iam-authenticator
      args:
        - "token"
        - "-i"
        - "example"
KUBECONFIG
}