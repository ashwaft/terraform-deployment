resource "aws_db_subnet_group" "db-subnet" {
  name       = "db-subnet-group"
  subnet_ids = ["subnet-061bffe90e7909287", "subnet-05d01ddea5466b79a"]
}


resource "aws_db_instance" "mars_rds_tf" {
  name                    = var.db_name
  username                = var.db_username
  password                = var.db_password
  identifier              = var.db_identifier
  allocated_storage       = 256 # gigabytes
  backup_retention_period = 7   # in days
  db_subnet_group_name    = aws_db_subnet_group.db-subnet.name
  engine                  = "postgres"
  engine_version          = "13.4"
  instance_class          = "db.t3.micro"
  multi_az                = true
  port                    = local.DB
  publicly_accessible     = false
  storage_encrypted       = false
  storage_type            = "gp2"
  vpc_security_group_ids  = ["${aws_security_group.mars_rds_sg_tf.id}"]
  skip_final_snapshot     = true
}
