resource "aws_instance" "server" {
  ami             = var.ami
  instance_type   = var.instance_type
  security_groups = var.security_groups
  user_data       = var.user_data
  tags = {
    Name = var.server_name
  }
}
