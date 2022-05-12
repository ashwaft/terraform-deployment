output "api_sg_group_id" {
  description = "The ID of the api security group"
  value       = aws_security_group.mars_api_sg.id
}

output "ui_sg_group_id" {
  description = "The ID of the ui security group"
  value       = aws_security_group.mars_react_sg.id
}

output "rds_sg_group_id" {
  description = "The ID of the rds security group"
  value       = aws_security_group.mars_rds_sg_tf.id
}

output "api_endpoint" {
  description = "The ID of the security group"
  value       = aws_lb.mars_lb_tf.dns_name
}

output "aws_db_instance_arn" {
  description = "The arn for the db"
  value       = aws_db_instance.mars_rds_tf.arn
}

output "db_endpoint" {
  description = "The endpoint for db"
  value       = aws_db_instance.mars_rds_tf.endpoint
}

output "aws_db_instance_name" {
  description = "The name of the db"
  value       = aws_db_instance.mars_rds_tf.name
}

output "aws_db_instance_db_identifier" {
  description = "The identifier for the db"
  value       = aws_db_instance.mars_rds_tf.identifier
}

output "user_data_api_launch_template" {
  description = "The User data for api"
  value       = aws_launch_template.mars_api_template-tf.user_data
}

# output "api_user_data" {
#   description = "User Data for SpringBoot Instances"
#   value = aws_instance.mars_smartbank_api.user_data_base64
# }

# output "ui_user_data" {
#   description = "User Data for REACT Instances"
#   value = aws_instance.mars_smartbank_react.user_data_base64
# }

output "bastion_ip" {
  description = "Bastion EC2 IP"
  value       = aws_instance.mars_bastion.public_ip
}