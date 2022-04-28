# Deploy to Kind

- https://argo-cd.readthedocs.io/en/stable/getting_started/

1. `kind create cluster`

2. Deploy argocd

```
kubectl create namespace argocd
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
```

3. Install argocd cli

`brew install argocd`

4. Connect using argocd's built-in port-forward

- Get default password:

```
kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d; echo
```

- Login with user `admin` and change password

```
export ARGOCD_OPTS='--port-forward-namespace argocd'

argocd login --port-forward

argocd account update-password

argocd app list
```

This will store the credentials in

```
# Mac
cat ~/.config/argocd/config

# Linux
cat ~/.argocd/config
```

- Open UI

```
kubectl port-forward svc/argocd-server -n argocd 8080:443
```

- Create An Application From A Git Repository

```
argocd app create guestbook \
  --repo https://github.com/argoproj/argocd-example-apps.git \
  --path guestbook \
  --dest-server https://kubernetes.default.svc \
  --dest-namespace default
```
