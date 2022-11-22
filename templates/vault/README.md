# Vault 

## Install
Configure the `values.yaml` and `certificate.yaml` files using your domain (for example vault.clusterXX.eurocchack22.ch ).

Use the `deploy.sh` script to deploy.

An ingress will be deployed at https://vault.clusterXX.eurocchack22.ch 

## Unseal Valut
After the install you need to split the Vault root token in keys, and use them to unseal vault. 

Go to the UI of vault (https://vault.clusterXX.eurocchack22.ch) and do that operation. 

`IMPORTANT` : Save the keys file!

Login to Vault using the root token. 