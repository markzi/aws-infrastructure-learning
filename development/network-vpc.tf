resource "aws_vpc" "development" {
  cidr_block = "10.0.0.0/16"
  # instance_tenancy     = "default"
  # enable_classiclink   = "false"
  enable_dns_support   = "true" #gives you an internal domain name
  enable_dns_hostnames = "true" #gives you an internal host name

  tags = {
    Key = "development"
  }
}

resource "aws_internet_gateway" "internet_gateway" {
  vpc_id = aws_vpc.development.id

  tags = {
    cust_Name = "internet-gateway"
  }
}

resource "aws_flow_log" "development" {
  iam_role_arn    = aws_iam_role.vpc_flow_logs_role.arn
  log_destination = aws_cloudwatch_log_group.flow_log.arn
  traffic_type    = "ALL"
  vpc_id          = aws_vpc.development.id
}
