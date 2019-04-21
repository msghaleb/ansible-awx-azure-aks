#!/bin/sh

SCRIPT_PATH=$(dirname "$0")
SCRIPT_PATH=$(eval "cd \"$SCRIPT_PATH\" && pwd")

panic() {
  echo $1
  exit 1
}
command -v terraform || panic "terraform is required, but not installed or not in your path"
command -v ansible-playbook || panic "ansible is required, but not installed or not in your path"
command -v kubectl || panic "kubectl is required, but not installed or not in your path"
command -v helm || panic "helm is required, but not installed or not in your path"

"${SCRIPT_PATH}/_run_terraform.sh"
sleep 5
"${SCRIPT_PATH}/_awx.sh"
sleep 5
"${SCRIPT_PATH}/_ingress.sh"
