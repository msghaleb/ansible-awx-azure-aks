#!/bin/sh

SCRIPT_PATH=$(dirname "$0")
SCRIPT_PATH=$(eval "cd \"$SCRIPT_PATH\" && pwd")

"${SCRIPT_PATH}/_run_terraform.sh"
"${SCRIPT_PATH}/_awx.sh"
