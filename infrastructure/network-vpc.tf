resource "aws_vpc" "vpc" {
  cidr_block = var.vpc_cidr
  # instance_tenancy     = "default"
  # enable_classiclink   = "false"
  enable_dns_support   = "true" #gives you an internal domain name
  enable_dns_hostnames = "true" #gives you an internal host name

  tags = {
    Name        = var.environment
    Environment = var.environment
  }
}

resource "aws_internet_gateway" "vpc" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Environment = var.environment
  }
}

resource "aws_flow_log" "vpc-flow-log" {
  iam_role_arn    = aws_iam_role.vpc-flow-logs-role.arn
  log_destination = aws_cloudwatch_log_group.cloudwatch-flow-log-group.arn
  traffic_type    = "ALL"
  vpc_id          = aws_vpc.vpc.id
}
