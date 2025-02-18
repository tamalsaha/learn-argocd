
- https://github.com/kubernetes-sigs/kustomize/blob/master/examples/chart.md

- https://github.com/kubernetes-sigs/kustomize/issues/5566

- https://github.com/kubernetes-sigs/kustomize/issues/1593

- https://www.cbui.dev/merging-helm-chart-values-with-kustomize/

```sh
APP_HOME=kubedb
mkdir -p $APP_HOME/base $APP_HOME/dev $APP_HOME/prod
```

```sh
function kustomizeIt {
  kustomize build \
    --enable-helm \
    $APP_HOME/$1
}
```

```sh
# APP_HOME=combined kustomizeIt base

APP_HOME=kubeops kustomizeIt base
APP_HOME=stash kustomizeIt base
APP_HOME=kubestash kustomizeIt base
APP_HOME=kubedb kustomizeIt base
APP_HOME=kubevault kustomizeIt base
```

```sh
# APP_HOME=combined kustomizeIt base | kubectl apply -f -

APP_HOME=kubeops kustomizeIt base | kubectl apply -f -
APP_HOME=stash kustomizeIt base | kubectl apply -f -
APP_HOME=kubestash kustomizeIt base | kubectl apply -f -
APP_HOME=kubedb kustomizeIt base | kubectl apply -f -
APP_HOME=kubevault kustomizeIt base | kubectl apply -f -
```
