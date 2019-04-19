#!/bin/bash
set -e
SCRIPT_PATH=$(dirname "$0")
SCRIPT_PATH=$(eval "cd \"$SCRIPT_PATH\" && pwd")
cd "${SCRIPT_PATH}/.."

if ! [ -d "awx" ]; then
  git clone https://github.com/ansible/awx.git
fi

cd awx
git fetch
git checkout 4.0.0

export KUBECONFIG="${SCRIPT_PATH}/../kubeconfig"

ansible-playbook -i ${SCRIPT_PATH}/../inventory.ini ${SCRIPT_PATH}/../awx/installer/install.yml
