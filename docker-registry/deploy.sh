#!/bin/bash

helm repo add twuni https://helm.twun.io


helm upgrade --install --create-namespace --namespace docker-registry -f values.yaml docker-registry twuni/docker-registry
kubectl apply -f certificate.yaml