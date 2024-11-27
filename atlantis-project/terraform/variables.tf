variable "aws_region" {
  description = "AWS Region"
  default     = "us-east-1"
}

variable "cluster_name" {
  description = "EKS Cluster Name"
  default     = "atlantis-cluster"
}

variable "subnet_ids" {
  description = "List of Subnet IDs"
  type        = list(string)
}
