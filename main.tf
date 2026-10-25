
provider "aws" {
  region = "us-east-1"
}

# RDS (Relational Database)
resource "aws_db_instance" "mydb" {
  identifier          = "my-rds-instance"
  engine              = "mysql"
  instance_class      = "db.t3.micro"
  allocated_storage   = 20
  username            = "admin"
  password            = var.db_password
  db_name             = "mydatabase"
  skip_final_snapshot = true
}

# DynamoDB (NoSQL Database)
resource "aws_dynamodb_table" "mytable" {
  name         = "my-dynamodb-table"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "id"

  attribute {
    name = "id"
    type = "S"
  }
}
