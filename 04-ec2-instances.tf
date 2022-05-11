# resource "aws_instance" "mars_smartbank_api" {
#   ami                         = "ami-02b92c281a4d3dc79"
#   instance_type               = "t2.micro"
#   subnet_id                   = "subnet-061bffe90e7909287"
#   associate_public_ip_address = true
#   tags                        = { Name = "Mars Terraform API" }
#   vpc_security_group_ids      = ["${aws_security_group.mars_api_sg.id}"]
#   user_data                   = file("${path.module}/bootstrap-api.sh")  

#   depends_on = [
#     aws_db_instance.mars_rds_tf,
#   ]
# }

# resource "aws_instance" "mars_smartbank_react" {
#   ami                         = "ami-02b92c281a4d3dc79"
#   instance_type               = "t2.micro"
#   subnet_id                   = "subnet-061bffe90e7909287"
#   associate_public_ip_address = true
#   tags                        = { Name = "Mars Terraform React" }
#   vpc_security_group_ids      = ["${aws_security_group.mars_react_sg.id}"]
#   user_data                   = file("${path.module}/bootstrap-ui.sh")
# }

#TODO: Create a public EC2 as a bastion host???
