resource "aws_sns_topic" "cpu_alert_topic" {
  name = "cpu-alert-topic"
}

resource "aws_sns_topic_subscription" "cpu_alert_email_subscription" {
  topic_arn = aws_sns_topic.cpu_alert_topic.arn
  protocol  = "email"
  endpoint  = var.sns_email
}

resource "aws_cloudwatch_metric_alarm" "frontend_cpu_alarm" {
  alarm_name          = "frontend-cpu-high"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 2
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = 120
  statistic           = "Average"
  threshold           = 50
  alarm_description   = "This metric monitors frontend cpu utilization"
  alarm_actions       = [aws_sns_topic.cpu_alert_topic.arn]

  dimensions = {
    InstanceId = var.frontend_instance_id
  }
}

resource "aws_cloudwatch_metric_alarm" "backend_cpu_alarm" {
  alarm_name          = "backend-cpu-high"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 2
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = 120
  statistic           = "Average"
  threshold           = 50
  alarm_description   = "This metric monitors backend cpu utilization"
  alarm_actions       = [aws_sns_topic.cpu_alert_topic.arn]

  dimensions = {
    InstanceId = var.backend_instance_id
  }
}
