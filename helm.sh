

https://github.com/argoproj/argocd-example-apps/tree/master/helm-guestbook

argocd app set helm-guestbook --values values-production.yaml


argocd app create helm-guestbook \
  --repo https://github.com/argoproj/argocd-example-apps.git \
  --path helm-guestbook \
  --dest-server https://kubernetes.default.svc \
  --dest-namespace default

argocd app set helm-guestbook --values values-production.yaml


argocd app create guestbook \
  --helm-set-string 'app=${ARGOCD_APP_NAME}'


  syncPolicy:
    syncOptions:
      - CreateNamespace=true



      release-v2021.11.24