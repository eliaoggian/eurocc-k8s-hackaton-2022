#!/bin/bash

SCRIPT_DIRECTORY=$(dirname "$0")

echo $SCRIPT_DIRECTORY

echo 'Please enter your cluster name (e.g "thanos" or "loki" or "hela", without quotes!)'
read cluster

echo "Replacing \"test.hack2022.ch\" with \"$cluster.hack2022.ch\" in all files now."
find $SCRIPT_DIRECTORY \( -type d -name .git -prune \) -o -type f -print0 | xargs -0 sed -i 's/test\.hack2022\.ch/$cluster.hack2022.ch/g'
# sed -i -r "s/test.hack2022.ch/$cluster.hack2022.ch/g" $SCRIPT_DIRECTORY

echo 'Please enter your cluster VIP range (in the format "148.187.83.XXX-148.187.83.YYY", without quotes!)'
read viprange

# sed -i -r "s/@@ADDRESS_POOL@@/$viprange/g" $SCRIPT_DIRECTORY
find $SCRIPT_DIRECTORY \( -type d -name .git -prune \) -o -type f -print0 | xargs -0 sed -i "s/@@ADDRESS_POOL@@/$viprange/g"

echo "All done! The files are ready for the cluster: $cluster" 