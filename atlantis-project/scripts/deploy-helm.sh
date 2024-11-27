#!/bin/bash

HELM_DIR="helm"
NAMESPACE="atlantis"

# Verifica se o Helm está instalado
if ! command -v helm &>/dev/null; then
  echo "Helm não está instalado. Por favor, instale-o antes de continuar."
  exit 1
fi

# Cria o namespace, se necessário
if ! kubectl get namespace ${NAMESPACE} &>/dev/null; then
  kubectl create namespace ${NAMESPACE}
  echo "Namespace ${NAMESPACE} criado."
fi

# Aplica o chart do Atlantis
helm repo add atlantis https://runatlantis.github.io/helm-charts
helm repo update
helm install atlantis atlantis/atlantis -n ${NAMESPACE} -f ${HELM_DIR}/values.yaml

echo "Atlantis instalado com sucesso no namespace ${NAMESPACE}!"
