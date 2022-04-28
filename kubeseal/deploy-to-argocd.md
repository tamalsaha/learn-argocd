# Deploy kubeseal helm chart using ArgoCD

```
k create ns kubeseal
k apply -f argocd-app.yaml

argocd app sync sealed-secrets
```
