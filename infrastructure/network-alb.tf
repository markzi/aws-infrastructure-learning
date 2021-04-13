resource "aws_lb" "alb" {
  name               = "services-alb"
  load_balancer_type = "application"
  # internal           = false
  security_groups = [aws_security_group.alb-security-group.id]
  subnets         = module.public_subnet.ids
  tags = {
    Name = "alb"
    Type = "public"
    Environment = var.environment
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_alb_target_group" "default" {
  name                 = join("-", [aws_lb.alb.name, "default"])
  port                 = 8080
  protocol             = "HTTP"
  vpc_id               = aws_vpc.vpc.id
  deregistration_delay = var.deregistration_delay

  health_check {
    path     = var.health_check_path
    protocol = "HTTP"
  }

  tags = {
    Environment = var.environment
  }
}

resource "aws_lb_listener" "default_response" {
  load_balancer_arn = aws_lb.alb.arn
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

resource "aws_security_group" "alb-security-group" {
  name   = "internal-alb-sg"
  vpc_id = aws_vpc.vpc.id

  tags = {
    Environment = var.environment
    Application = "ecs"
  }
}

# # TODO this will have to change to be only from the API Gateway & maybe Bastion
resource "aws_security_group_rule" "https_from_anywhere" {
  type              = "ingress"
  from_port         = 8080
  to_port           = 8080
  protocol          = "TCP"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.alb-security-group.id
}

# # TODO this will have to change to be only from the API Gateway & maybe Bastion
resource "aws_security_group_rule" "outbound_internet_access" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.alb-security-group.id
}
