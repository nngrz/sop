#!/bin/bash

# This script checks if the second and n-th parameter exist

# Example Usage:
# When there are two parameters and n = 2:
# bash: ./parameter_check.sh a1 a2                                                 
# Enter the value of n: 2
# The 2-nd parameter exists and the value is 'a2'.

read -p "Enter the value of n: " n

# Check 2nd parameter
if test "$#" -lt 2; then
   echo "The 2-nd parameter does not exist"
else
   echo "The 2-nd parameter exist and equals '$2'"
fi

# Only check for the n-th parameter if n != 2
if test "$n" -eq 2; then
  exit 0
fi

if test "$#" -ge "$n"; then
  echo "The ${n}-th parameter exists and the value is '${!n}'."
else
  echo "The ${n}-th parameter does not exist (only $# parameters provided)."
fi
