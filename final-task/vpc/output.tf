output "vpc" {
  value = aws_vpc.lohika_vpc
}

output "vpc_az_public_1" {
  value = aws_subnet.lohika_public_subnet_1
}

output "vpc_az_public_2" {
  value = aws_subnet.lohika_public_subnet_2
}

output "public_subnet_1_id" {
  value = aws_subnet.lohika_public_subnet_1.id
}

output "public_subnet_2_id" {
  value = aws_subnet.lohika_public_subnet_2.id
}

output "private_subnet_1_id" {
  value = aws_subnet.lohika_private_subnet_1.id
}

output "private_subnet_2_id" {
  value = aws_subnet.lohika_private_subnet_2.id
}