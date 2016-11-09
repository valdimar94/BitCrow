#!/bin/bash

set -e

install=$(cat $(dirname $0)/../$1/install.config)
if [ "$install" != "y" ]
  then
    exit 0
fi

file=$(dirname $0)/../$1/configured.config
configured=$([ -f $file ] && cat $file || echo "n")
if [ "$configured" == "y" ]
  then
    chmod +x $(dirname $0)/../$1/install.sh
    ./$(dirname $0)/../$1/install.sh
fi

exit 0
