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

module "alb" {
  source = "./modules/alb"

  // pass variables from .tfvars
  hosted_zone_id           = "${var.hosted_zone_id}"
  hosted_zone_url          = "${var.hosted_zone_url}"
  // inputs from modules
  vpc_id                  = "${module.network.vpc_id}"
  gateway_subnet_ids      = "${module.network.gateway_subnet_ids}"
  node_sg_id              = "${module.eks.node_sg_id}"
  lb_target_group_arn     = "${module.eks.target_group_arn}"
}