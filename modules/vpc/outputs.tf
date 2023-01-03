output "vpc_id" {
  value       = aws_vpc.my_custom_vpc.id
  description = "VPC Id"
}

output "public_subnet_ids" {
  value       = aws_subnet.public_subnet[*].id
  description = "Public Subnet's Ids"
}

output "private_subnet_ids" {
  value       = aws_subnet.private_subnet[*].id
  description = "Private Subnet's Ids"
}

output "availability_zones" {
  value       = data.aws_availability_zones.available.names
  description = "Available availability zones"
}
