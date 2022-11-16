#!/bin/bash

helm repo add hashicorp https://helm.releases.hashicorp.com

helm install --namespace vault --create-namespace --version 0.22.1 -f values.yaml vault hashicorp/vault

kubectl apply -f certificate.yaml