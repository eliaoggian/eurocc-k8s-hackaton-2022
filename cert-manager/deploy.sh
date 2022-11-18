#!/bin/bash

helm repo add jetstack https://charts.jetstack.io
helm repo update jetstack

helm repo add cert-manager-webhook-pdns https://zachomedia.github.io/cert-manager-webhook-pdns
helm repo update cert-manager-webhook-pdns

helm install --namespace cert-manager --create-namespace --version v1.10.0 -f values.yaml cert-manager jetstack/cert-manager
helm install --namespace cert-manager --create-namespace --version 2.1.3 cert-manager-webhook-pdns cert-manager-webhook-pdns/cert-manager-webhook-pdns

if [ -z "$PDNS_API_KEY" ]; then
    echo "\$PDNS_API_KEY is empty. Please set it with the API key of the PowerDNS server"
    exit 1
fi

kubectl -n cert-manager create secret generic pdns-secret --from-literal=pdns_api_key=$PDNS_API_KEY

kubectl apply -f selfsigned-issuer.yaml 
kubectl apply -f ca-cert.yaml 
kubectl apply -f ca-issuer.yaml 
kubectl apply -f cert-manager-issuer.yaml