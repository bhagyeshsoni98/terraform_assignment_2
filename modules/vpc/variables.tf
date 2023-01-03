variable "vpc_cidr" {
  type        = string
  description = "Cidr Block for VPC"
}

variable "public_subnet_count" {
  type        = number
  description = "Public Subnet count in custom vpc"
}

variable "private_subnet_count" {
  type        = number
  description = "Private Subnet count in custom vpc"
}

variable "eks_cluster_name" {
  type        = string
  description = "EKS cluster name to be added in tags"
}
