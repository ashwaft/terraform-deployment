/**************************************************************
* Input Variables:
* Reusable variables for configuration
* String, List, Map, Boolean
**************************************************************/
variable "aws_region" {
  description = "Region in which AWS Resources to be created"
  type        = string
  default     = "us-west-2"
}

variable "db_name" {
  description = "Database Name"
  type        = string
}

variable "db_identifier" {
  description = "Database Identifier"
  type        = string
}

variable "db_username" {
  description = "Database Username"
  type        = string
}

variable "db_password" {
  description = "RDS Database Administrator Password"
  type        = string
  sensitive   = true
}




# variable "api_iam_instance_profile" {
#   description = "Name of IAM instance profile associated with launched instances"
#   default     = null
# }