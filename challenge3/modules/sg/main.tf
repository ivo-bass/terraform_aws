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
