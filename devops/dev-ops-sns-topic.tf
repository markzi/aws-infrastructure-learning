data "aws_caller_identity" "current" {}

output "account_id" {
  value = data.aws_caller_identity.current.account_id
}

data "template_file" "aws_cf_sns_stack" {
  template = file("${path.module}/templates/cf_aws_sns_email_stack.json.tpl")
  vars = {
    sns_topic_name   = var.sns_topic_name
    sns_display_name = var.sns_topic_display_name
    sns_subscription_list = join(",", formatlist("{\"Endpoint\": \"%s\",\"Protocol\": \"%s\"}",
      var.sns_subscription_email_address_list,
    var.sns_subscription_protocol))
    aws_account_current = data.aws_caller_identity.current.account_id
    aws_account_development = var.aws_account_development
    region                  = var.aws_region
  }
}

output "aws_cf_sns_stack_rendered" {
  value = data.template_file.aws_cf_sns_stack.rendered
}

resource "aws_cloudformation_stack" "tf_sns_topic" {
  name          = "snsStack"
  template_body = data.template_file.aws_cf_sns_stack.rendered
  tags = {
    name = "DevOps-SnsStack"
  }
}