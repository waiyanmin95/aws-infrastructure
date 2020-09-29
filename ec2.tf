data "template_file" "user_data" {
  template = file("install_nginx.sh")
}

module "ec2" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "2.15.0"

  name           = var.ec2.name
  instance_count = var.ec2.ins_count

  ami                    = var.ec2.ami_id
  instance_type          = var.ec2.ins_type
  key_name               = var.ec2.keyname
  monitoring             = var.ec2.is_monitor
  vpc_security_group_ids = [module.sg-web.this_security_group_id]
  subnet_ids             = [module.vpc.public_subnets[0], module.vpc.public_subnets[1]]
  user_data              = data.template_file.user_data.rendered

  #Optional Configuration
  ebs_optimized = var.ec2.ebs_optimize
  tags = {
    Name        = var.ec2.name
    Environment = var.vpc.env
    Owner       = var.vpc.owner
  }
}
