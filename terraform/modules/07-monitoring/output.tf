output "sns_topic_arn" {
  value = aws_sns_topic.cpu_alert_topic.arn
}
