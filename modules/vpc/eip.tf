resource "aws_eip" "my_eip" {
  count = length(aws_subnet.public_subnet)
  vpc      = true
}