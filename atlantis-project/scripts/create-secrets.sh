#!/bin/bash

# Substitua pelos seus valores reais
GITHUB_TOKEN="your-github-token"
WEBHOOK_SECRET="your-webhook-secret"

# Verifica se os secrets já existem
if kubectl get secret atlantis-secrets &>/dev/null; then
  echo "Secrets já existem. Nada a fazer."
else
  kubectl create secret generic atlantis-secrets \
    --from-literal=gh-token=${GITHUB_TOKEN} \
    --from-literal=webhook-secret=${WEBHOOK_SECRET}
  echo "Secrets criados com sucesso!"
fi
