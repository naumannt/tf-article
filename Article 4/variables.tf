variable "aws_region" {
 type = "string"
 description = "Used AWS Region."
}
variable "aws_access_key" {
 type = "string"
 description = "The account identification key used by your Terraform client."
}
variable "aws_secret_key" {
 type = "string"
 description = "The secret key used by your terraform client to access AWS."
}

variable "subnet_count" {
    type        = "string"
    description = "The number of subnets we want to create per type to ensure high availability."
}

variable "accessing_computer_ip" {
 type = "string"
 description = "IP of the computer to be allowed to connect to EKS master and nodes."
}

variable "keypair-name" {
  type = "string"
  description = "Name of the keypair declared in AWS IAM, used to connect into your instances via SSH."
}