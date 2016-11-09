#!/bin/bash

set -e

echo "Pick a port for OpenSSH?"
read port
echo "$port" > $(dirname $0)/port.config

exit 0
