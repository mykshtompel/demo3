# logs.tf

# Set up CloudWatch group and log stream and retain logs for 30 days
resource "aws_cloudwatch_log_group" "web_server_log_group" {
  name              = "/ecs/web-server"
  retention_in_days = 30

  tags = {
    Name = "web-server-log-group"
  }
}

resource "aws_cloudwatch_log_stream" "web_server_log_stream" {
  name           = "${var.app}-${var.env}-${var.name_container}-log-stream"
  log_group_name = aws_cloudwatch_log_group.web_server_log_group.name
}
