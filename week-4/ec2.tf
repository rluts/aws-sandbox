resource "aws_instance" "lohika_public_ec2" {
  ami             = "ami-013a129d325529d4d"
  instance_type   = "t2.micro"
  key_name        = var.key_name
  security_groups = [aws_security_group.lohika_sg_public_egress.id, aws_security_group.lohika_sg_public_http.id, aws_security_group.lohika_sg_public_ssh.id]
  subnet_id       = aws_subnet.lohika_public_subnet.id
  user_data       = data.template_file.user_data_public.rendered
  tags = {
    Name = "lohika_public_ec2"
  }
}

resource "aws_instance" "lohika_private_ec2" {
  ami             = "ami-013a129d325529d4d"
  instance_type   = "t2.micro"
  key_name        = var.key_name
  security_groups = [aws_security_group.lohika_sg_public_egress.id, aws_security_group.lohika_sg_private_http.id, aws_security_group.lohika_sg_private_ssh.id]
  subnet_id       = aws_subnet.lohika_private_subnet.id
  user_data       = data.template_file.user_data_private.rendered
  depends_on      = [aws_instance.lohika_nat_server]
  tags = {
    Name = "lohika_private_ec2"
  }
}

resource "aws_instance" "lohika_nat_server" {
  ami               = "ami-0032ea5ae08aa27a2"
  instance_type     = "t2.micro"
  subnet_id         = aws_subnet.lohika_public_subnet.id
  source_dest_check = false
  security_groups   = [aws_security_group.lohika_sg_public_egress.id, aws_security_group.lohika_sg_public_http.id]
  tags = {
    Name = "lohika_nat_server"
  }
}