output "cluster_name" {
  description = "Nome do cluster EKS"
  value       = aws_eks_cluster.this.name
}

output "cluster_endpoint" {
  description = "Endpoint do cluster EKS"
  value       = aws_eks_cluster.this.endpoint
}

output "cluster_arn" {
  description = "ARN do cluster EKS"
  value       = aws_eks_cluster.this.arn
}

output "node_role_arn" {
  description = "ARN do role associado ao cluster EKS"
  value       = aws_iam_role.eks_role.arn
}
