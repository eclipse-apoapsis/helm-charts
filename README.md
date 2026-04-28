# Eclipse Apoapsis Helm Charts

This repository contains Helm charts for the Eclipse Apoapsis project.

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
