resource "aws_lb" "services_alb" {
  name               = "services-alb"
  load_balancer_type = "application"
  internal           = false
  security_groups    = [aws_security_group.alb_sg.id]
  subnets            = [aws_subnet.public_subnet_az1.id, aws_subnet.public_subnet_az2.id]
  tags = {
    Name = "alb"
    Type = "public"
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_lb_listener" "default_response" {
  load_balancer_arn = aws_lb.services_alb.arn
  port              = "8080"
  protocol          = "HTTP"

  default_action {
    type = "fixed-response"

    fixed_response {
      content_type = "text/plain"
      message_body = "Fixed response content"
      status_code  = "200"
    }
  }
}