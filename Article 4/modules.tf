module "network" {
  source = "./modules/network"

  // pass variables from .tfvars
  aws_region       = "${var.aws_region}"
  subnet_count     = "${var.subnet_count}"
}

module "eks" {
  source = "./modules/eks"

  // pass variables from .tfvars
  accessing_computer_ip   = "${var.accessing_computer_ip}"
  aws_region              = "${var.aws_region}"
  keypair-name            = "${var.keypair-name}"
  // inputs from modules
  vpc_id                  = "${module.network.vpc_id}"
  app_subnet_ids          = "${module.network.app_subnet_ids}"
}