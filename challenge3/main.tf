provider "aws" {
  region = "eu-central-1"
}

module "security_groups" {
  source       = "./modules/sg"
  ingress_rule = [80, 443]
  egress_rule  = [80, 443]
  web_sg_name  = "Web_Access"
}

module "ec2_db" {
  source        = "./modules/ec2"
  ami           = "ami-0eb7496c2e0403237"
  instance_type = "t2.micro"
  server_name   = "DB_Server"
}

module "ec2_web" {
  source          = "./modules/ec2"
  ami             = "ami-0eb7496c2e0403237"
  instance_type   = "t2.micro"
  server_name     = "WEB_Server"
  user_data       = file("scripts/init.sh")
  security_groups = [module.security_groups.sg_name]
}

module "eip" {
  source      = "./modules/eip"
  eip_name    = "Web_Server_Elastic_IP"
  instance_id = module.ec2_web.instance_id
}
