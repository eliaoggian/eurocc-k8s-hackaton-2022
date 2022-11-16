#!/bin/bash

helm repo add twuni https://helm.twun.io
helm repo update twuni

helm upgrade --install --version 2.2.2 --create-namespace --namespace docker-registry -f values.yaml docker-registry twuni/docker-registry

kubectl apply -f certificate.yaml