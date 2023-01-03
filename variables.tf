variable "aws_region" {
  type        = string
  description = "AWS region in which infrastructure need to be setup"
  default     = "us-east-1"
}

# variable "eks_attributes" {
#   description = "EKS module variables"
# }

# variable "vpc_attributes" {
#   description = "VPC module variables"
# }

variable "rds_attributes" {
  description = "RDS module variables"
}

variable "eks_cluster_name" {
  type    = string
  default = "terraform_assignment"
}
