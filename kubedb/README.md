# Deploy KubeDB operator using ArgoCD

- Deploy KubeDB Helm chart. Update the Application CRD to include License key.

```
> k apply -f argocd-app.yaml
> argocd app sync kubedb
```

- After the chart is deployed, you might see `OutOfSync` status because the `{Mutating|Validating}WebhookConfiguration` cabundle has been updated by the operator itself. To address this, we need to update the `argocd-cm` configmap and add the following keys:

```
k edit cm argocd-cm -n argocd
```

```
data:
  resource.customizations.ignoreDifferences.admissionregistration.k8s.io_MutatingWebhookConfiguration: |
    jqPathExpressions:
    - '.webhooks[]?.clientConfig.caBundle'
  resource.customizations.ignoreDifferences.admissionregistration.k8s.io_ValidatingWebhookConfiguration: |
    jqPathExpressions:
    - '.webhooks[]?.clientConfig.caBundle'
```

You can learn more on this from the official ArgoCD docs:

- https://argo-cd.readthedocs.io/en/stable/user-guide/diffing/#system-level-configuration
- https://github.com/argoproj/argo-cd/blob/master/docs/operator-manual/argocd-cm.yaml#L82-L91
