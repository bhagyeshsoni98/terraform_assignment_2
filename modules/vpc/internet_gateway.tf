resource "aws_internet_gateway" "my_igw" {
  vpc_id = aws_vpc.my_custom_vpc.id

  tags = {
    Name = "my_custom_igw"
  }
}