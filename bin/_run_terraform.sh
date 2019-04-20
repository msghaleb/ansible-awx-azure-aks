#!/bin/bash
set -e

SCRIPT_PATH=$(dirname "$0")
SCRIPT_PATH=$(eval "cd \"$SCRIPT_PATH\" && pwd")


cd "${SCRIPT_PATH}/../terraform"

terraform init
terraform plan
terraform apply
