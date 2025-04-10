#!/bin/bash

# This script counts the number of environment variables
# Example Usage:
# Run the bash command: ./env_var.sh

# Use `xargs` here to trim leading/trailing whitespace from the output of `wc -l`
count=$(printenv | wc -l | xargs)

echo "There are $count environment variables defined in the system."
