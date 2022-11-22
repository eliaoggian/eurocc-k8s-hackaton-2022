#!/bin/bash

SCRIPT_DIRECTORY=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
SCRIPT_NAME=$(basename "$0")
TEMPLATES_DIRECTORY="$SCRIPT_DIRECTORY/templates"

echo 'Please enter your cluster name (e.g "thanos" or "loki" or "hela", without quotes!)'
read cluster

CLUSTER_DIRECTORY="$SCRIPT_DIRECTORY/clusters/$cluster"
mkdir -p $CLUSTER_DIRECTORY
cp -r $TEMPLATES_DIRECTORY/* $CLUSTER_DIRECTORY
find $CLUSTER_DIRECTORY \( -type d -name .git -prune \) -o -type f -print0 | xargs -0 sed -i "" "s/test.hack2022.ch/$cluster.hack2022.ch/g"
echo "[OK] - Files copied"

echo 'Please enter your cluster VIP range (in the format "148.187.83.XXX-148.187.83.YYY", without quotes!)'
read viprange
find $CLUSTER_DIRECTORY \( -type d -name .git -prune \) -o -type f -print0 | xargs -0 sed -i "" "s/@@ADDRESS_POOL@@/$viprange/g"
echo "[OK] - VIP Range configured"

echo "[OK] - Success! The files for the cluster are here: $CLUSTER_DIRECTORY" 