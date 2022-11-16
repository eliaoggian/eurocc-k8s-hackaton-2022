# Metallb

## Installation

```
helm repo add metallb https://metallb.github.io/metallb
helm upgrade --install --namespace metallb-system --create-namespace --version 0.13.7 metallb metallb/metallb
```

### Create Layer 2 Advertisment

```
kubectl apply -f l2advertisement.yaml
```

## Configure ip pool resource

Set correct IP address range (use the range you got from the mentors)
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

Apply the manifest:
```
kubectl apply -f ipaddresspool.yaml
```


