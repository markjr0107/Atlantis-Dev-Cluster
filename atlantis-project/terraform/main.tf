provider "aws" {
  region = var.aws_region
}

resource "aws_eks_cluster" "this" {
  name     = var.cluster_name
  role_arn = aws_iam_role.eks_role.arn

  vpc_config {
    subnet_ids = var.subnet_ids
  }
}

output "cluster_name" {
  value = aws_eks_cluster.this.name
}
