output "db_server_private_ip" {
  value = aws_instance.db_server.private_ip
}

output "web_server_public_ip" {
  value = aws_eip.elastic_ip.public_ip
}
