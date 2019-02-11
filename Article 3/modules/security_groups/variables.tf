variable "accessing_computer_ip" {
 type = "string"
 description = "IP of the computer to be allowed to connect to EKS master and nodes."
}

variable "vpc_id" {
  type = "string"
  description = "ID of the VPC used to setup the cluster."
}
