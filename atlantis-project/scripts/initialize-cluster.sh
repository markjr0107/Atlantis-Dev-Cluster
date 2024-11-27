#!/bin/bash

# Diretório onde estão os arquivos Terraform
TERRAFORM_DIR="terraform"

cd ${TERRAFORM_DIR}

terraform init
terraform plan
terraform apply -auto-approve

echo "Cluster EKS provisionado com sucesso!"
