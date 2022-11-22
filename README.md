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

## Requirements
1. Install helmfile: https://github.com/helmfile/helmfile#installation


2. Install helm-diff plugin: 
   ```
    helm plugin install https://github.com/databus23/helm-diff
   ```


## Usage

1. Configure what do you want to deploy in the `values.yaml` file.
2. Identify your cluster name (for example, `loki`)
3. Deploy the charts setting the Power DNS API key (if needed):
   ```
    helmfile sync -e loki --set pdnsApiKey=mySuperSecretApiKey
   ```