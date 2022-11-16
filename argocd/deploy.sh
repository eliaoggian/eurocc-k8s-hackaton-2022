#!/bin/bash

helm repo add argo https://argoproj.github.io/argo-helm
helm repo update argo

kubectl create ns argocd

helm upgrade --install --namespace argocd --version 5.13.8 -f values.yaml argocd argo/argo-cd

kubectl apply -f certificate.yaml