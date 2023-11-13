#!/bin/bash

# indexes would be like this
# 3148375653:3544603:免疫機構
# 3148375653:3544604:メヒカノス
indexes=$(grep -n "$1" "$2")
for index in "${indexes[@]}"; do
  IFS=':'
  # split each line by ':'
  set -- $index
  # $1 is line number
  # $2 is block number
  # $3 is block name
  echo $1

done
