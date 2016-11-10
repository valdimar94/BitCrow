#!/bin/bash

set -e

echo "Would you like to add franz to startup applications(y/n)?"
read startup
if [ "$startup" == "y" ]
  then
    echo "true" > $(dirname $0)/startup.config
  else
    echo "false" > $(dirname $0)/startup.config
fi

exit 0
