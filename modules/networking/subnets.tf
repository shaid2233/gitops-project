resource "aws_subnet" "public_subnet for nat gateway" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "us-east-1a"


  tags = {
    Name = "Main"
  }
}


resource "aws_subnet" "private" {
  count = 2

  vpc_id            = aws_vpc.main.id
  cidr_block        = var.private_subnet_cidrs[count.index]
  availability_zone = var.azs[count.index]

  tags = {
    Name = "private-${count.index}"
  }
}




resource "aws_db_subnet_group" "default" {
  name       = "main"
  subnet_ids = [aws_subnet.frontend.id, aws_subnet.backend.id]

  tags = {
    Name = "My DB subnet group"
  }
}


