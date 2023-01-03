variable "eks_cluster_name" {
  type        = string
  description = "EKS cluster name"
  default     = "terraform_assignment"
}

variable "public_subnet_ids" {
  type        = list(string)
  description = "List of public ids"
}

variable "private_subnet_ids" {
  type        = list(string)
  description = "List of private ids"
}

###############
# Frontend node group variables
###############

variable "frontend_node_group_name" {
  type        = string
  description = "Name of frontend node group"
  default     = "frontend_node_group"
}

variable "frontend_scaling_config_vars" {
  type = object({
    desired_size = number
    max_size     = number
    min_size     = number
  })
  description = "Frontend node group scaling config vars"
  default = {
    desired_size = 2
    max_size     = 2
    min_size     = 1
  }
}

variable "frontend_node_group_instance_types" {
  type        = list(string)
  description = "List of frontend instance types"
  default     = ["t2.micro"]
}

variable "frontend_node_group_capacity_type" {
  type        = string
  description = "Capacity type of spot or on-demand for frontend node group instances"
  default     = "SPOT"
}

###############
# Backend node group variables
###############

variable "backend_node_group_name" {
  type        = string
  description = "Name of backend node group"
  default     = "backend_node_group"
}

variable "backend_scaling_config_vars" {
  type = object({
    desired_size = number
    max_size     = number
    min_size     = number
  })
  description = "Backend node group scaling config vars"
  default = {
    desired_size = 2
    max_size     = 2
    min_size     = 1
  }
}

variable "backend_node_group_instance_types" {
  type        = list(string)
  description = "List of backend instance types"
  default     = ["t2.micro"]
}

###############
# Reserved instance policy variables
###############

variable "reserved_instances_type" {
  type        = string
  description = "Instance type for reserved instances"
  default     = "t2.micro"
}

variable "reserved_instances_platform" {
  type        = string
  description = "Platform for reserved instances"
  default     = "Linux/UNIX"
}

variable "reserved_instances_az" {
  type        = string
  description = "Availability zone for reserved instances"
  default     = "us-east-1a"
}
