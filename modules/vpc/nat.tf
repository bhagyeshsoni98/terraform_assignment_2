resource "aws_nat_gateway" "nat_gw" {
  count = length(aws_subnet.public_subnet)
  allocation_id = aws_eip.my_eip[count.index].id
  connectivity_type = "public"
  subnet_id     = aws_subnet.public_subnet[count.index].id

  tags = {
    Name = "Nat-gw"
  }

  depends_on = [aws_internet_gateway.my_igw]
}