provider "aws" {
  region = var.aws_region
}

# IAM Role para o cluster
resource "aws_iam_role" "eks_role" {
  name = "${var.cluster_name}-eks-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Effect = "Allow",
      Principal = {
        Service = "eks.amazonaws.com"
      }
      Action = "sts:AssumeRole"
    }]
  })

  tags = {
    Environment = var.environment
    Project     = var.project_name
  }
}

# Cluster EKS
resource "aws_eks_cluster" "this" {
  name     = var.cluster_name
  role_arn = aws_iam_role.eks_role.arn

  vpc_config {
    subnet_ids = var.subnet_ids
  }

  depends_on = [aws_iam_role.eks_role]

  tags = {
    Environment = var.environment
    Project     = var.project_name
  }
}
