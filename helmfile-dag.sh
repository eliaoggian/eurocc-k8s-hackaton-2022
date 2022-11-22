#!/bin/bash

file=$(mktemp -t hf)

trap "exit 0" INT # ctrl+c is somewhat a regular exit
trap "exit" TERM ERR
trap "rm $file 2>/dev/null || true" EXIT

# ensure a helmfile is present
helmfile $@ list > $file

# read helmfile output and stop when the info is displayed
start=0
helmfile --log-level debug $@ sync 2>&1 | tee $file | while IFS='' read -r line
do
  [[ "$line" == *"groups of releases in this order"* ]] && start=1
  if [[ "$line" == "processing releases in group 1"* ]]; then
    start=0
    rm $file # all went fine
    kill -INT -$$ # send ctrl+c to the process, the only way to kill everything right away
  fi
  [[ "$start" == 1 ]] && echo "$line"
done

if [ -f $file ]; then
  # if the file is still present, it means the process
  # didn't complete as expected. Show the logs
  echo -e "An error occurred. Here is the full log:"
  cat $file
fi
