resource "aws_budgets_budget" "monthly_cost_budget" {
  name         = "monthly-budget"
  budget_type  = "COST"
  time_unit    = "MONTHLY"
  limit_amount = var.budget_limit
  limit_unit   = "USD"

  notification {
    comparison_operator        = "GREATER_THAN"
    threshold                  = 0.1
    threshold_type             = "PERCENTAGE"
    notification_type          = "ACTUAL"
    subscriber_sns_topic_arns  = [aws_sns_topic.cost_alert.arn]
  }
}
