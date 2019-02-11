module "network" {
  source = "./modules/network"

  // pass variables from .tfvars
  aws_region       = "${var.aws_region}"
  subnet_count     = "${var.subnet_count}"
}

module "security_groups" {
  source = "./modules/security_groups"

  // pass variables from .tfvars
  accessing_computer_ip   = "${var.accessing_computer_ip}"

  // inputs from modules
  vpc_id                  = "${module.network.vpc_id}"
}