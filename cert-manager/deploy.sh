#!/bin/bash

helm repo add jetstack https://charts.jetstack.io
helm repo add cert-manager-webhook-pdns https://zachomedia.github.io/cert-manager-webhook-pdns


helm install --namespace cert-manager --version v1.10.0 -f values.yaml cert-manager jetstack/cert-manager
helm install -n cert-manager cert-manager-webhook-pdns cert-manager-webhook-pdns/cert-manager-webhook-pdns

kubectl apply -f selfsigned-issuer.yaml 
kubectl apply -f ca-cert.yaml 
kubectl apply -f ca-issuer.yaml 
kubectl apply -f cert-manager-issuer.yaml