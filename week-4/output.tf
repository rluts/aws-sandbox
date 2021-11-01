output "public_instance_public_ip" {
  value = aws_instance.lohika_public_ec2.public_ip
}

output "private_instance_private_ip" {
  value = aws_instance.lohika_private_ec2.private_ip
}

output "load_balancer_public_dns" {
  value = aws_lb.lohika_load_balancer.dns_name
}
