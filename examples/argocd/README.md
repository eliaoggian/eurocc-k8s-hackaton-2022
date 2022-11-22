# ArgoCD

## Access ArgoCD
An ingress will be deployed at https://argocd.clusterXX.eurocchack22.ch 

Retrieve the password for the admin user:
```
kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d ; echo
```