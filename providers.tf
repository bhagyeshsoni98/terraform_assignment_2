terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }

    kubernetes = {
      source = "hashicorp/kubernetes"
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

provider "kubernetes" {
  config_path = "~/.kube/config"
}
