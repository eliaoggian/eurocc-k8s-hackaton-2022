#!/bin/bash

helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx
helm repo update ingress-nginx

kubectl create ns ingress-nginx

helm upgrade --install --namespace ingress-nginx --version 4.4.0 ingress-nginx ingress-nginx/ingress-nginx