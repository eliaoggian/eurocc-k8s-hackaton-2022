#!/bin/bash

helm repo add metallb https://metallb.github.io/metallb

helm upgrade --install --namespace metallb-system --create-namespace metallb metallb/metallb

kubectl apply -f ipaddresspool.yaml
kubectl apply -f l2advertisement.yaml