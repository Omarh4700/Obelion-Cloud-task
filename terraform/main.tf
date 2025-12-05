module "vpc" {
  source = "./modules/01-vpc"
}

module "subnet" {
  source = "./modules/02-subnet"
  vpc_id = module.vpc.vpc_id
}

module "route_table" {
  source            = "./modules/03-route_table"
  vpc_id            = module.vpc.vpc_id
  igw_id            = module.vpc.igw_id
  public_subnets_A  = module.subnet.public_subnets_A_id
  public_subnets_B  = module.subnet.public_subnets_B_id
  private_subnets_A = module.subnet.private_subnets_A_id
  private_subnets_B = module.subnet.private_subnets_B_id
}

module "security_groups" {
  source = "./modules/04-security_group"
  vpc_id = module.vpc.vpc_id
}

module "RDS_subnet_group" {
  source              = "./modules/05-RDS/Subnet-groups"
  vpc_id              = module.vpc.vpc_id
  private_subnet_A_id = module.subnet.private_subnets_A_id
  private_subnet_B_id = module.subnet.private_subnets_B_id
}

module "RDS_parameter_group" {
  source = "./modules/05-RDS/Parameter-groups"
}

module "RDS" {
  source                   = "./modules/05-RDS"
  vpc_id                   = module.vpc.vpc_id
  rds_sg_id                = module.security_groups.database_sg_id
  RDS_subnet_group_name    = module.RDS_subnet_group.RDS_subnet_group_id
  RDS_parameter_group_name = module.RDS_parameter_group.parameter_group_name
}

module "instances" {
  source             = "./modules/06-instances"
  public_subnet_A_id = module.subnet.public_subnets_A_id
  public_subnet_B_id = module.subnet.public_subnets_B_id
  frontend_sg_id     = module.security_groups.frontend_sg_id
  backend_sg_id      = module.security_groups.backend_sg_id
}

module "monitoring" {
  source               = "./modules/07-monitoring"
  sns_email            = var.alert_email
  frontend_instance_id = module.instances.frontend_instance_id
  backend_instance_id  = module.instances.backend_instance_id
}

module "nacl" {
  source             = "./modules/08-nacl"
  vpc_id             = module.vpc.vpc_id
  public_subnet_ids  = [module.subnet.public_subnets_A_id, module.subnet.public_subnets_B_id]
  private_subnet_ids = [module.subnet.private_subnets_A_id, module.subnet.private_subnets_B_id]
}
