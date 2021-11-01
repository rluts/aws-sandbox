resource "aws_alb_target_group" "lohika_alb_target_group" {
  name     = "lohika-alb-target-group"
  vpc_id   = aws_vpc.lohika_vpc.id
  protocol = "HTTP"
  port     = 80
  tags = {
    Name = "lohika_alb_target_group"
  }
}

resource "aws_alb_target_group_attachment" "lohika_target_private_instance" {
  target_group_arn = aws_alb_target_group.lohika_alb_target_group.arn
  target_id        = aws_instance.lohika_private_ec2.id
}

resource "aws_alb_target_group_attachment" "lohika_target_public_instance" {
  target_group_arn = aws_alb_target_group.lohika_alb_target_group.arn
  target_id        = aws_instance.lohika_public_ec2.id
}

resource "aws_lb" "lohika_load_balancer" {
  name            = "lohika-load-balancer"
  internal        = false
  security_groups = [aws_security_group.lohika_sg_public_http.id, aws_security_group.lohika_sg_public_egress.id]
  subnets         = [aws_subnet.lohika_public_subnet.id, aws_subnet.lohika_private_subnet.id]
  tags = {
    Name = "lohika_load_balancer"
  }
}

resource "aws_alb_listener" "lohika_alb_listener" {
  load_balancer_arn = aws_lb.lohika_load_balancer.arn
  port              = 80
  default_action {
    type             = "forward"
    target_group_arn = aws_alb_target_group.lohika_alb_target_group.arn
  }
}
