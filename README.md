# Eclipse Apoapsis Helm Charts

This repository contains Helm charts for the Eclipse Apoapsis project.

## ORT Server

A Helm chart for deploying the [ORT Server](https://github.com/eclipse-apoapsis/ort-server).

Chart releases are available via:

- **GitHub Releases:** Download the chart archive from the [releases page](https://github.com/eclipse-apoapsis/helm-charts/releases).
- **GitHub OCI Registry:** Pull directly with Helm:
  ```shell
  helm pull oci://ghcr.io/eclipse-apoapsis/charts/ort-server --version <version>
  ```

## ORT Server Dev Stack

A Helm chart for spinning up a local ORT Server environment on [kind](https://kind.sigs.k8s.io/) (Kubernetes in Docker).
It bundles ORT Server together with dependencies like PostgreSQL, RabbitMQ, and Keycloak.

**1. Create the kind cluster** using the provided configuration:

```shell
kind create cluster --config charts/dev-stack/kind-cluster.yaml
```

**2. Install the chart:**

```shell
helm dependency update charts/dev-stack
helm install dev charts/dev-stack
```

## Contributing

Chart documentation is generated from `values.yaml` comments using [helm-docs](https://github.com/norwoodj/helm-docs).
See the [installation instructions](https://github.com/norwoodj/helm-docs#installation) to install the tool before contributing.

To regenerate the chart `README.md` files manually, run:

```shell
helm-docs --chart-to-generate charts/ort-server --sort-values-order=file
```

To do this automatically on every commit, run this once after cloning:

```shell
git config core.hooksPath hooks
```
