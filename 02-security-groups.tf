/******************* API SG ***********************/
resource "aws_security_group" "mars_api_sg" {
  name        = "mars-smartbank-api-sg-tf"
  description = "Terraform Mars API SG"
  vpc_id      = "vpc-0a57416e207a78d4e"
  # SSH access from anywhere
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  # HTTP access from the internet
  ingress {
    from_port       = local.API
    to_port         = local.API
    protocol        = "tcp"
    security_groups = ["${aws_security_group.mars_lb_sg.id}"]
  }
  # outbound internet access
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

/******************* UI SG ***********************/
resource "aws_security_group" "mars_react_sg" {
  name        = "mars-smartbank-react-sg-tf"
  description = "Terraform Mars React SG"
  vpc_id      = "vpc-0a57416e207a78d4e"
  # SSH access from anywhere
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  # HTTP access from the internet
  ingress {
    from_port       = local.React
    to_port         = local.React
    protocol        = "tcp"
    security_groups = ["${aws_security_group.mars_lb_sg.id}"]
  }
  # outbound internet access
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

/******************* RDS SG **********************/
resource "aws_security_group" "mars_rds_sg_tf" {
  name        = "mars-rds-sg-tf"
  description = "Mars Terraform RDS SG"
  vpc_id      = "vpc-0a57416e207a78d4e"

  ingress {
    from_port   = local.API
    to_port     = local.API
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = local.DB
    to_port     = local.DB
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  # HTTP access from the internet
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = local.DB
    to_port     = local.DB
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}


/******************* ALB SG **********************/
resource "aws_security_group" "mars_lb_sg" {
  name        = "mars-smartbank-lb-sg-tf"
  description = "mars Terraform LB SG"
  vpc_id      = "vpc-0a57416e207a78d4e"
  # SSH access from anywhere
  ingress {
    from_port   = local.React
    to_port     = local.React
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = local.API
    to_port     = local.API
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  # outbound internet access
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
