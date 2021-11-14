resource "aws_autoscaling_group" "lohika_asg" {
  name                = "lohika_asg"
  max_size            = 2
  min_size            = 2
  vpc_zone_identifier = [var.public_subnet_1_id, var.public_subnet_2_id]
  target_group_arns   = [aws_alb_target_group.lohika_alb_target_group.arn]

  instance_refresh {
    strategy = "Rolling"
    preferences {
      min_healthy_percentage = 50
    }
  }

  launch_template {
    id      = aws_launch_template.lohika_launch_template.id
    version = "$Latest"
  }
}

resource "aws_launch_template" "lohika_launch_template" {
  name                   = "lohika_launch_template"
  image_id               = var.ami_id
  instance_type          = var.instance_type
  update_default_version = true
  key_name               = var.key_name

  tag_specifications {
    resource_type = "instance"
    tags = {
      Name = "lohika_public_ec2"
    }
  }

  iam_instance_profile {
    arn = aws_iam_instance_profile.lohika_instance_profile.arn
  }
  vpc_security_group_ids = [
    aws_security_group.lohika_sg_public_http.id,
    aws_security_group.lohika_sg_public_ssh.id,
    aws_security_group.lohika_sg_public_egress.id
  ]
  user_data = base64encode(data.template_file.user_data_public.rendered)
}

resource "aws_instance" "lohika_private_ec2" {
  ami                  = var.nat_ami_id
  instance_type        = var.instance_type
  key_name             = var.key_name
  security_groups      = [aws_security_group.lohika_sg_public_egress.id, aws_security_group.lohika_sg_private_http.id, aws_security_group.lohika_sg_private_ssh.id]
  subnet_id            = var.private_subnet_1_id
  user_data            = data.template_file.user_data_private.rendered
  iam_instance_profile = aws_iam_instance_profile.lohika_instance_profile.id
  depends_on           = [aws_instance.lohika_nat_server]

  tags = {
    Name = "lohika_private_ec2"
  }
}

resource "aws_instance" "lohika_nat_server" {
  ami               = "ami-0032ea5ae08aa27a2"
  instance_type     = var.instance_type
  subnet_id         = var.public_subnet_1_id
  source_dest_check = false
  security_groups = [
    aws_security_group.lohika_sg_public_egress.id,
    aws_security_group.lohika_sg_public_http.id
  ]
  tags = {
    Name = "lohika_nat_server"
  }
}