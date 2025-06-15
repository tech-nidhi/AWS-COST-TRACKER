resource "aws_sns_topic" "cost_alert" {
  name = "cost_alert"
}

resource "aws_sns_topic_subscription" "email_sub" {
  topic_arn = aws_sns_topic.cost_alert.arn
  protocol  = "email"
  endpoint  = var.notification_email
}