#!/bin/bash
set -e

SCRIPT_PATH=$(dirname "$0")
SCRIPT_PATH=$(eval "cd \"$SCRIPT_PATH\" && pwd")
panic() {
  echo $1
  exit 1
}
command -v terraform || panic "terraform is required, but not installed or not in your path"
command -v ansible-playbook || panic "ansible is required, but not installed or not in your path"
command -v kubectl || panic "kubectl is required, but not installed or not in your path"

cd "${SCRIPT_PATH}/../terraform"

terraform init
terraform plan
terraform apply
