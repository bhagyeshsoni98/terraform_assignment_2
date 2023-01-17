data "aws_eks_cluster_auth" "eks_cluster" {
  name = module.eks.eks_cluster_name
}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }

    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "2.16.1"
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
  host                   = module.eks.endpoint
  cluster_ca_certificate = base64decode(module.eks.kubeconfig-certificate-authority-data)
  token                  = data.aws_eks_cluster_auth.eks_cluster.token
}
