module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = var.vpc.name
  cidr = var.vpc.cidr

  azs              = var.vpc.azs
  private_subnets  = var.vpc.private
  public_subnets   = var.vpc.public
  database_subnets = var.vpc.database

  #Database Subnet Group
  create_database_subnet_group       = true
  create_database_subnet_route_table = true

  #Tagging Override
  public_route_table_tags     = var.vpc.pub_rt_tags
  private_route_table_tags    = var.vpc.pri_rt_tags
  database_route_table_tags   = var.vpc.db_rt_tags
  igw_tags                    = var.vpc.igw_tags
  nat_gateway_tags            = var.vpc.natgw_tags
  nat_eip_tags                = var.vpc.nateip_tags
  public_subnet_tags          = var.vpc.pubsub_tags
  private_subnet_tags         = var.vpc.prisub_tags
  database_subnet_tags        = var.vpc.dbsub_tags
  default_network_acl_tags    = var.vpc.nacl_tags
  database_subnet_group_tags  = var.vpc.db_sub_gp_tags
  default_security_group_tags = var.vpc.default_sg_tags
  default_security_group_name = var.vpc.default_sg_name

  #Default Network ACL can be manage or not
  manage_default_network_acl = true

  #VPC DNS Support
  enable_dns_hostnames = true
  enable_dns_support   = true

  #Single NAT Gateway
  enable_nat_gateway     = true
  single_nat_gateway     = true
  one_nat_gateway_per_az = false

  # VPC endpoint for S3
  enable_s3_endpoint = true

  tags = {
    Environment = var.vpc.env
    Owner       = var.vpc.owner
    Team        = var.vpc.team
  }
}
