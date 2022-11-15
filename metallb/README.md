# Metallb

## Installation

```
helm repo add metallb https://metallb.github.io/metallb
helm upgrade --install --namespace metallb-system --create-namespace metallb metallb/metallb
```

## Create ip pool resource
```
apiVersion: metallb.io/v1beta1
kind: IPAddressPool
metadata:
  name: pool-cluster01
  namespace: metallb-system
spec:
  addresses:
  - 148.187.82.201-148.187.82.205
```
Use your assigned ip range

