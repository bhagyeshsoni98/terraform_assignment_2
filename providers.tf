terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
  default_tags {
    tags = {
      Owner                                           = "Bhagyesh Soni"
      "kubernetes.io/cluster/${var.eks_cluster_name}" = "owned"
    }
  }
}
