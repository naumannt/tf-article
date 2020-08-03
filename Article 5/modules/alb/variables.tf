variable "vpc_id" {
  type = "string"
}
variable "hosted_zone_id" {
  type = "string"
  description = "ID of the hosted Zone created in Route53 before Terraform deployment."
}

variable "hosted_zone_url" {
  type = "string"
  description = "URL of the hosted Zone created in Route53 before Terraform deployment."
}


variable "gateway_subnet_ids" {
  type = "list"
  description = "List containing the IDs of all created gateway subnets."
}

variable "node_sg_id" {
  type = "string"
  description = "ID of the Security Group used by the Kubernetes worker nodes."
}

variable "lb_target_group_arn" {
  type = "string"
  description = "ARN of the Target Group pointing at the Kubernetes nodes."
}
