output "DB_Private_IP" {
  value = module.ec2_db.private_ip
}

output "WEB_Private_IP" {
  value = module.ec2_web.private_ip
}

output "Web_Server_Public_IP" {
  value = module.eip.public_ip
}
