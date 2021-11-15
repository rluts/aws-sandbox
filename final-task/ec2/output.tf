output "nat_server_id" {
  value = aws_instance.lohika_nat_server.id
}

output "elb_dns" {
  value = aws_lb.lohika_load_balancer.dns_name
}