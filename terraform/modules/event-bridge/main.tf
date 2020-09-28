resource "aws_cloudwatch_event_rule" "scheduler" {
  name                = "every-five-minutes"
  description         = "Fires every five minutes"
  schedule_expression = "rate(5 minutes)"
}

resource "aws_cloudwatch_event_target" "trigger_lambda" {
  arn  = var.lambda_function_arn
  rule = aws_cloudwatch_event_rule.scheduler.name
}
