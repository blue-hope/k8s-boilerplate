# Argo CD Chart

A Helm chart for Argo CD, a declarative, GitOps continuous delivery tool for Kubernetes.

Source code can be found [here](https://argo-cd.readthedocs.io/en/stable/)

## Changes

- Fix Argo CD UI redirection [issue](https://github.com/argoproj/argo-cd/issues/2953) ~> `--insecure` on [`values.yaml`](https://github.com/blue-hope/k8s-boilerplate/blob/master/helm/charts/autoconfig/argo-cd/values.yaml#L896)
