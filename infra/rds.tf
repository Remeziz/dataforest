resource "aws_db_subnet_group" "default" {
  name       = "main-db-subnet-group"
  subnet_ids = module.vpc.private_subnets

  tags = {
    Name = "Main DB subnet group"
  }
}

resource "aws_db_instance" "postgres" {
  identifier              = "app-postgres"
  engine                  = "postgres"
  instance_class          = "db.t3.micro"
  allocated_storage       = 20
  storage_type            = "gp2"
  username                = "postgres"
  password                = "StrongPassw"
  skip_final_snapshot     = true
  db_subnet_group_name    = aws_db_subnet_group.default.name
  vpc_security_group_ids  = [aws_security_group.db.id]
  multi_az                = false
  publicly_accessible     = false

  tags = {
    Name = "Postgres DB"
  }
}
