# KubeStash Catalog

[KubeStash Catalog](https://github.com/kubestash) - Catalog of KubeStash Addons

## TL;DR;

```bash
$ helm repo add appscode https://charts.appscode.com/stable/
$ helm repo update
$ helm search repo appscode/kubestash-catalog --version=v2025.2.10
$ helm upgrade -i kubestash-catalog appscode/kubestash-catalog -n kubestash --create-namespace --version=v2025.2.10
```

## Introduction

This chart deploys KubeStash catalog on a [Kubernetes](http://kubernetes.io) cluster using the [Helm](https://helm.sh) package manager.

## Prerequisites

- Kubernetes 1.14+

## Installing the Chart

To install/upgrade the chart with the release name `kubestash-catalog`:

```bash
$ helm upgrade -i kubestash-catalog appscode/kubestash-catalog -n kubestash --create-namespace --version=v2025.2.10
```

The command deploys KubeStash catalog on the Kubernetes cluster in the default configuration. The [configuration](#configuration) section lists the parameters that can be configured during installation.

> **Tip**: List all releases using `helm list`

## Uninstalling the Chart

To uninstall the `kubestash-catalog`:

```bash
$ helm uninstall kubestash-catalog -n kubestash
```

The command removes all the Kubernetes components associated with the chart and deletes the release.

## Configuration

The following table lists the configurable parameters of the `kubestash-catalog` chart and their default values.

|             Parameter             |                                                           Description                                                           |       Default        |
|-----------------------------------|---------------------------------------------------------------------------------------------------------------------------------|----------------------|
| proxies.ghcr                      |                                                                                                                                 | <code>ghcr.io</code> |
| waitTimeout                       | proxies: ghcr: harbor.appscode.ninja/ghcr Number of seconds to wait for the database to be ready before backup/restore process. | <code>300</code>     |
| kubedump.enabled                  | If true, deploy kubedump addon                                                                                                  | <code>true</code>    |
| kubedump.backup.sanitize          | Specify whether to remove the decorator                                                                                         | <code>true</code>    |
| kubedump.backup.labelSelector     | Specify label selector to filter resources                                                                                      | <code>""</code>      |
| kubedump.backup.includeDependants | Specify whether to include the dependants resources along with it's parent                                                      | <code>false</code>   |
| pvc.enabled                       | If true, deploys PVC addon                                                                                                      | <code>true</code>    |
| volumesnapshot.enabled            | If true, deploys VolumeSnapshot addon                                                                                           | <code>true</code>    |
| workload.enabled                  | If true, deploys Workload addon                                                                                                 | <code>true</code>    |
| manifest.enabled                  | If true, deploys Manifest addon                                                                                                 | <code>true</code>    |


Specify each parameter using the `--set key=value[,key=value]` argument to `helm upgrade -i`. For example:

```bash
$ helm upgrade -i kubestash-catalog appscode/kubestash-catalog -n kubestash --create-namespace --version=v2025.2.10 --set proxies.ghcr=ghcr.io
```

Alternatively, a YAML file that specifies the values for the parameters can be provided while
installing the chart. For example:

```bash
$ helm upgrade -i kubestash-catalog appscode/kubestash-catalog -n kubestash --create-namespace --version=v2025.2.10 --values values.yaml
```
