variable "aws_profile" {
  type        = string
  description = "The AWS profile to use when running terraform commands"
}

variable "aws_region" {
  type        = string
  description = "The AWS region the resources will be created in"
}

variable "sns_subscription_email_address_list" {
   type = list(string)
   description = "List of email addresses"
 }
 
 variable "sns_subscription_protocol" {
   type = string
   default = "email"
   description = "SNS subscription protocal"
 }
 
 variable "sns_topic_name" {
   type = string
   default = "dev-ops-sns"
   description = "SNS topic name"
 }
 
 variable "sns_topic_display_name" {
   type = string
   default = "dev ops sns"
   description = "SNS topic display name"
 }