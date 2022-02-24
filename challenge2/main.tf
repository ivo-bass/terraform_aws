provider "aws" {
  region = var.provider_region
}

resource "aws_security_group" "web_traffic" {
  name = var.web_sg_name

  dynamic "ingress" {
    iterator = port
    for_each = var.ingress_rule
    content {
      from_port   = port.value
      to_port     = port.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  dynamic "egress" {
    iterator = port
    for_each = var.egress_rule
    content {
      from_port   = port.value
      to_port     = port.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
  tags = {
    Name = var.web_sg_name
  }
}

resource "aws_instance" "db_server" {
  ami           = var.db_ami
  instance_type = var.db_instance_type
  tags = {
    Name = var.db_server_name
  }
}

resource "aws_instance" "web_server" {
  ami             = var.web_ami
  instance_type   = var.web_instance_type
  security_groups = [aws_security_group.web_traffic.name]
  user_data       = file("init.sh")
  tags = {
    Name = var.web_server_name
  }
}

resource "aws_eip" "elastic_ip" {
  instance = aws_instance.web_server.id
  tags = {
    Name = var.eip_name
  }
}
