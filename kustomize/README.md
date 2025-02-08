
https://github.com/kubernetes-sigs/kustomize/blob/master/examples/chart.md

```sh

DEMO_HOME=kubedb
mkdir -p $DEMO_HOME/base $DEMO_HOME/dev $DEMO_HOME/prod

```

```
function kustomizeIt {
  kustomize build \
    --enable-helm \
    $DEMO_HOME/$1
}
```