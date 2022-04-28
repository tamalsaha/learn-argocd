
- https://github.com/bitnami-labs/sealed-secrets/tree/v0.17.5/helm/sealed-secrets

```
> helm repo add sealed-secrets https://bitnami-labs.github.io/sealed-secrets
> helm install my-release sealed-secrets/sealed-secrets
```

You should now be able to create sealed secrets.

1. Install the client-side tool (kubeseal) as explained in the docs below:

    https://github.com/bitnami-labs/sealed-secrets#installation-from-source

2. Create a sealed secret file running the command below:

    kubectl create secret generic secret-name --dry-run=client --from-literal=foo=bar -o yaml | \
    kubeseal \
      --controller-name=my-release-sealed-secrets \
      --controller-namespace=default \
      --format yaml > mysealedsecret.yaml

The file mysealedsecret.yaml is a commitable file.

If you would rather not need access to the cluster to generate the sealed secret you can run:

    kubeseal \
      --controller-name=my-release-sealed-secrets \
      --controller-namespace=default \
      --fetch-cert > mycert.pem

to retrieve the public cert used for encryption and store it locally. You can then run 'kubeseal --cert mycert.pem' instead to use the local cert e.g.

    kubectl create secret generic secret-name --dry-run=client --from-literal=foo=bar -o yaml | \
    kubeseal \
      --controller-name=my-release-sealed-secrets \
      --controller-namespace=default \
      --format yaml --cert mycert.pem > mysealedsecret.yaml

3. Apply the sealed secret

    kubectl create -f mysealedsecret.yaml

Running 'kubectl get secret secret-name -o yaml' will show the decrypted secret that was generated from the sealed secret.
