resource "aws_lb" "lohika_load_balancer" {
  name            = "lohika-load-balancer"
  internal        = false
  security_groups = [aws_security_group.lohika_sg_public_http.id, aws_security_group.lohika_sg_public_egress.id]
  subnets         = [var.public_subnet_1_id, var.public_subnet_2_id]
  tags = {
    Name = "lohika_load_balancer"
  }
}

resource "aws_alb_target_group" "lohika_alb_target_group" {
  name     = "lohika-alb-target-group"
  vpc_id   = var.vpc.id
  protocol = "HTTP"
  port     = 80
  health_check {
    port = 80
    path = "/actuator/health"
  }
  tags = {
    Name = "lohika_alb_target_group"
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
