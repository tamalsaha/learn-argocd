# argocd

- https://argo-cd.readthedocs.io/en/stable/user-guide/kustomize/#kustomizing-helm-charts

```yaml
apiVersion: v1
kind: ConfigMap
metadata:
  name: argocd-cm
  namespace: argocd
data:
  kustomize.buildOptions: --enable-helm
```
