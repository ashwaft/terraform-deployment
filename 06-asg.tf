# API - SpringBoot
resource "aws_launch_template" "mars_api_template-tf" {
  name          = "mars-api-tf"
  image_id      = "ami-02b92c281a4d3dc79"
  instance_type = "t2.micro"
   user_data     = base64encode(templatefile("api_install.tftpl", { db_endpoint = "${aws_db_instance.mars_rds_tf.endpoint}" }))

   depends_on = [
     aws_db_instance.mars_rds_tf,
   ]

  network_interfaces {
    subnet_id       = "subnet-061bffe90e7909287"
    security_groups = ["${aws_security_group.mars_api_sg.id}"]
  }

  iam_instance_profile {
    name = "cloudwatch"
  }

  tag_specifications {
    resource_type = "instance"

    tags = {
      Name = "mars-api-tf"
    }
  }
}

# UI - React
resource "aws_launch_template" "mars_react_template-tf" {
  name          = "mars-ui-tf"
  image_id      = "ami-02b92c281a4d3dc79"
  instance_type = "t2.micro"
  tags          = { Name = "mars Terraform React" }
  user_data     = filebase64("${path.module}/bootstrap-ui.sh")

  network_interfaces {
    subnet_id       = "subnet-061bffe90e7909287"
    security_groups = ["${aws_security_group.mars_react_sg.id}"]
  }

  tag_specifications {
    resource_type = "instance"

    tags = {
      Name = "mars-ui-tf"
    }
  }
}

resource "aws_autoscaling_group" "mars_api_asg-tf" {
  vpc_zone_identifier = ["subnet-061bffe90e7909287", "subnet-05d01ddea5466b79a"]
  name                = "mars-api-asg-tf"
  desired_capacity    = 2
  max_size            = 2
  min_size            = 2
  target_group_arns   = ["${aws_lb_target_group.mars_api_tg_tf.arn}"]
  launch_template {
    id      = aws_launch_template.mars_api_template-tf.id
    version = "$Latest"
  }
}

resource "aws_autoscaling_group" "mars_react_asg-tf" {
  vpc_zone_identifier = ["subnet-061bffe90e7909287", "subnet-05d01ddea5466b79a"]
  name                = "mars-react-asg-tf"
  desired_capacity    = 2
  max_size            = 4
  min_size            = 2
  target_group_arns   = ["${aws_lb_target_group.mars_react_tg_tf.arn}"]
  launch_template {
    id      = aws_launch_template.mars_react_template-tf.id
    version = "$Latest"
  }
}
