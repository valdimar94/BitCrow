#!/bin/bash

set -e

echo "What is your git account's email address?"
read email
echo "$email" > $(dirname $0)/email.config

echo "What is your name?"
read name
echo "$name" > $(dirname $0)/name.config

exit 0
