resource "aws_eip" "elastic_ip" {
  instance = var.instance_id
  tags = {
    Name = var.eip_name
  }
}