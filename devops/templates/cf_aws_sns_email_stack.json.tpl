{
 "AWSTemplateFormatVersion": "2010-09-09",
  "Resources": {
    "SNSTopic": {
      "Type": "AWS::SNS::Topic",
      "Properties": {
        "TopicName": "${sns_topic_name}",
        "DisplayName": "${sns_display_name}",
        "Subscription": [
          ${sns_subscription_list}
        ]
      }
    },
    "SNSTopicPolicy" : {
      "Type" : "AWS::SNS::TopicPolicy",
      "Properties" : {
        "PolicyDocument" : {
          "Id": "EnvironmentAccessPolicy",
          "Version": "2012-10-17",
          "Statement": [{
            "Effect": "Allow",
            "Principal": {
                "AWS": "*"
            },
            "Action": "sns:Publish",
            "Resource": [
              "arn:aws:sns:${region}:${aws_account_current}:${sns_topic_name}"
            ],
            "Condition": {
              "ForAnyValue:ArnLike": {
                "aws:SourceArn": [
                  "arn:aws:cloudwatch:${region}:${aws_account_current}:alarm:*",
                  "arn:aws:cloudwatch:${region}:${aws_account_development}:alarm:*"
                ]
              }
            }
          }]
        },
        "Topics" : [ { "Ref" : "SNSTopic" } ]
      }
    }
  }
}