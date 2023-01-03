module "vpc" {
  source               = "./modules/vpc"
  vpc_cidr             = "10.10.0.0/21"
  public_subnet_count  = 2
  private_subnet_count = 2
  eks_cluster_name     = "terraform_assignment"
}

module "eks" {
  source             = "./modules/eks"
  eks_cluster_name   = "terraform_assignment"
  public_subnet_ids  = module.vpc.public_subnet_ids
  private_subnet_ids = module.vpc.private_subnet_ids
  # desired_size      = 1
  # max_size          = 2
  # min_size          = 1
}

module "rds" {
  source             = "./modules/rds"
  rds_instance_name  = var.rds_attributes.instance_name
  rds_instance_class = var.rds_attributes.instance_class
  db_username        = var.rds_attributes.db_username
  private_subnet_ids = module.vpc.private_subnet_ids
  # backend_sg_id      = module.ec2.backend_sg_id
}
