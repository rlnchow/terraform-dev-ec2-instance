output "ec2_ip" {
  value = module.ec2-instance.public_ip
}

output "ec2_id" {
  value = module.ec2-instance.id
}

