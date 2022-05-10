/*********************** Target Groups ***************************/
resource "aws_lb_target_group" "mars_api_tg_tf" {
  name     = "mars-api-tg-tf"
  port     = 8080
  protocol = "HTTP"
  vpc_id   = "vpc-0a57416e207a78d4e"
}

resource "aws_lb_target_group" "mars_react_tg_tf" {
  name     = "mars-react-tg-tf"
  port     = 3000
  protocol = "HTTP"
  vpc_id   = "vpc-0a57416e207a78d4e"
}

/****************** Application Load Balancer ********************/
resource "aws_lb" "mars_lb_tf" {
  name               = "mars-lb-tf"
  internal           = false
  load_balancer_type = "application"
  security_groups    = ["${aws_security_group.mars_lb_sg.id}"]
  subnets            = ["subnet-034e789f0990c2b56", "subnet-048dc9ace73c28f7b"]

  #enable_deletion_protection = true

  # access_logs {
  #   bucket  = aws_s3_bucket.lb_logs.bucket
  #   prefix  = "test-lb"
  #   enabled = true
  # }
}

/****************** API Listener ********************/
resource "aws_lb_listener" "mars_api_listener_tf" {
  load_balancer_arn = aws_lb.mars_lb_tf.arn
  port              = "8080"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.mars_api_tg_tf.arn
  }
}

/****************** UI Listener ********************/
resource "aws_lb_listener" "mars_react_listener_tf" {
  load_balancer_arn = aws_lb.mars_lb_tf.arn
  port              = "3000"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.mars_react_tg_tf.arn
  }
}
