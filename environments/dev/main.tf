module "vpc" {
  source = "../../modules/vpc"

  project_name = var.project_name
  environment  = var.environment

  vpc_cidr = var.vpc_cidr

  public_subnet_1_cidr  = var.public_subnet_1_cidr
  public_subnet_2_cidr  = var.public_subnet_2_cidr
  private_subnet_1_cidr = var.private_subnet_1_cidr
  private_subnet_2_cidr = var.private_subnet_2_cidr
}
module "kms" {
  source = "../../modules/kms"

  project_name = var.project_name
  environment  = var.environment
}
module "s3" {
  source = "../../modules/s3"

  project_name = var.project_name
  environment  = var.environment

  kms_key_arn = module.kms.kms_key_arn
}
module "iam" {
  source = "../../modules/iam"

  project_name = var.project_name
  environment  = var.environment
}