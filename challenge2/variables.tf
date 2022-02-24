variable "provider_region" {
  default = "eu-central-1"
}

variable "vpc_name" {
  default = "Main_VPC"
}

variable "vpc_cidr" {
  default = "192.168.0.0/24"
}

variable "db_ami" {
  default = "ami-0eb7496c2e0403237"
}

variable "web_ami" {
  default = "ami-0eb7496c2e0403237"
}

variable "db_instance_type" {
  default = "t2.micro"
}

variable "web_instance_type" {
  default = "t2.micro"
}

variable "db_server_name" {
  default = "DB_Server"
}

variable "web_server_name" {
  default = "Web_Server"
}

variable "eip_name" {
  default = "Web_Server_Elastic_IP"
}

variable "ingress_rule" {
  default = [80, 443]
}

variable "egress_rule" {
  default = [80, 443]
}

variable "web_sg_name" {
  default = "Web_Access"
}
