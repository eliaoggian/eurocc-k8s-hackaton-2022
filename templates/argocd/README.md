# ArgoCD

## Install
Configure the `values.yaml` and `certificate.yaml` files using your domain (for example argocd.clusterXX.eurocchack22.ch ).

Use the `deploy.sh` script to deploy.

An ingress will be deployed at https://argocd.clusterXX.eurocchack22.ch 

## Access ArgoCD

Retrieve the password for the admin user:
```
kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d ; echo
```