resource "aws_cloudwatch_log_group" "cloudwatch-flow-log-group" {
  name = "flow_log"

  retention_in_days = 1
}