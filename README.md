# linkwarden-chart

Helm chart to install [Linkwarden](https://github.com/linkwarden/linkwarden)

## Usage

[Helm](https://helm.sh) must be installed to use the charts. Please refer to
Helm's [documentation](https://helm.sh/docs) to get started.

Once Helm has been set up correctly, add the repo as follows:

```shell
helm repo add linkwarden-chart https://cyanidium.github.io/linkwarden-chart
```

If you had already added this repo earlier, run `helm repo update` to retrieve
the latest versions of the packages. You can then run `helm search repo <alias>` to see the charts.

To install the chart:

```shell
helm install my-chart linkwarden-chart/linkwarden
```

To uninstall the chart:

```shell
helm uninstall my-chart
```
