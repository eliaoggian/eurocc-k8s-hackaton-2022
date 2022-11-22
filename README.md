# eurocc-k8s-hackaton-2022

This repo contains some useful manifests and files (with examples) that can help the teams to install and configure some services on the k8s cluster.

* argocd
* cert-manager
* docker-registry
* external-dns
* ingress-nginx
* metallb
* storage
* vault
  
## Usage
Build the templates using the `prepare.sh` bash script. It will create a new directory `clusters` with the manifests containing the correct values for your cluster. 