resource "aws_cloudwatch_log_group" "flow_log" {
  name = "flow_log"

  retention_in_days = 1
}