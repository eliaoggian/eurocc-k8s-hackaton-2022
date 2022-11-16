#!/bin/bash

kubectl create ns external-dns

kubectl -n external-dns create secret generic pdns-eoggian --from-literal=pdns_api_key=$PASSWORD_SVC

helm repo add bitnami https://charts.bitnami.com/bitnami

helm install -f values.yaml -n external-dns --version 6.11.3 external-dns bitnami/external-dns