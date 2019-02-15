variable "vpc_id" {
  type = "string"
}

variable "accessing_computer_ip" {
    type = "string"
    description = "Public IP of the computer accessing the cluster via kubectl or browser."
}

variable "aws_region" {
  type = "string"
  description = "WIP: List of used aws_regions. Should be a single one, might not be used at all."
}

variable "keypair-name" {
  type = "string"
}

variable "app_subnet_ids" {
  type = "string"
}