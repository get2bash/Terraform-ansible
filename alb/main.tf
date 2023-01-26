terraform {
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "4.0.0"
    }
  }
}

provider "aws" {
  profile    = "default"
  region     = "us-east-1"
}

# create application load balancer
resource "aws_lb" "alb" {
  name               = "alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.lb_sg.id]
  subnets            = [for subnet in aws_subnet.public : subnet.id]

  enable_deletion_protection = true

  tags = {
    Name = "mini-project"
  }
}

# create target group
resource "aws_lb_target_group" "t_group" {
  name        = "mini-project"
  port        = 8000
  protocol    = "HTTP"
  vpc_id      = aws_vpc.my_Vpc.id

  health_check {
    enabled = true
    path = "/"
    port = "8000"
    protocol = "HTTP"
    healthy_threshold = 3
    unhealthy_threshold = 2
    interval = 90
    timeout = 20
    matcher = "200"
  }

  depends_on = [aws_lb.alb]
}

# create a listener on port 80 with redirect action
resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.alb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.t_group.arn

  }
}

# create a target group attachment
resource "aws_lb_target_group_attachment" "test" {
  target_group_arn = aws_lb_target_group.t_group.arn
  target_id        = aws_instance.instances.id
  port             = 80
}
