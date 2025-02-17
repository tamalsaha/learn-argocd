# KubeStash Metrics

[KubeStash Metrics](https://github.com/kubestash) - KubeStash State Metrics

## TL;DR;

```bash
$ helm repo add appscode https://charts.appscode.com/stable/
$ helm repo update
$ helm search repo appscode/kubestash-metrics --version=v2025.2.10
$ helm upgrade -i kubestash-metrics appscode/kubestash-metrics -n kubestash --create-namespace --version=v2025.2.10
```

## Introduction

This chart deploys KubeStash metrics configurations on a [Kubernetes](http://kubernetes.io) cluster using the [Helm](https://helm.sh) package manager.

## Prerequisites

- Kubernetes 1.14+

## Installing the Chart

To install/upgrade the chart with the release name `kubestash-metrics`:

```bash
$ helm upgrade -i kubestash-metrics appscode/kubestash-metrics -n kubestash --create-namespace --version=v2025.2.10
```

The command deploys KubeStash metrics configurations on the Kubernetes cluster in the default configuration. The [configuration](#configuration) section lists the parameters that can be configured during installation.

> **Tip**: List all releases using `helm list`

## Uninstalling the Chart

To uninstall the `kubestash-metrics`:

```bash
$ helm uninstall kubestash-metrics -n kubestash
```

The command removes all the Kubernetes components associated with the chart and deletes the release.


