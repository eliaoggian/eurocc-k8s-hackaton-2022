#!/bin/bash

helm repo add bitnami https://charts.bitnami.com/bitnami

kubectl create ns harbor

# This requires cert-manager and external-dns to be installed and working
kubectl apply -f certificate.yaml

helm upgrade --install -n harbor -f values.yaml harbor bitnami/harbor