#!/bin/bash
set -e
SCRIPT_PATH=$(dirname "$0")
SCRIPT_PATH=$(eval "cd \"$SCRIPT_PATH\" && pwd")
panic() {
  echo $1
  exit 1
}
cd "${SCRIPT_PATH}/.."

if ! [ -d "awx" ]; then
  git clone https://github.com/ansible/awx.git
fi

cd awx
git fetch
git checkout 4.0.0
