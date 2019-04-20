#!/bin/bash
set -e
SCRIPT_PATH=$(dirname "$0")
SCRIPT_PATH=$(eval "cd \"$SCRIPT_PATH\" && pwd")
cd "${SCRIPT_PATH}/.."

export KUBECONFIG="${SCRIPT_PATH}/../kubeconfig"

helm init

helm install stable/nginx-ingress --namespace awx --set controller.replicaCount=2 --set rbac.create=false