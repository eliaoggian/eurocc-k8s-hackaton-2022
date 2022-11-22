#!/bin/bash

helm repo add metallb https://metallb.github.io/metallb
helm repo update metallb

helm upgrade --install --namespace metallb-system --create-namespace metallb metallb/metallb

echo "Waiting 30s to let metallb webhooks to be ready"
sleep 30

kubectl apply -f ipaddresspool.yaml
kubectl apply -f l2advertisement.yaml