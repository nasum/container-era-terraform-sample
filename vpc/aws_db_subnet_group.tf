resource "aws_db_subnet_group" "main" {
  name       = "db-subnet"
  subnet_ids = [aws_subnet.private_subnet_1.id, aws_subnet.private_subnet_2.id]
}