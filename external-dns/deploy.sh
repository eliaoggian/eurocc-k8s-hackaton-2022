#!/bin/bash

kubectl create ns external-dns

if [ -z "$PDNS_API_KEY" ]; then
    echo "\$PDNS_API_KEY is empty. Please set it with the API key of the PowerDNS server"
    exit 1
fi

kubectl -n external-dns create secret generic pdns-eoggian --from-literal=pdns_api_key=$PDNS_API_KEY

helm repo add bitnami https://charts.bitnami.com/bitnami
helm repo update bitnami

helm install -f values.yaml -n external-dns --version 6.11.3 external-dns bitnami/external-dns