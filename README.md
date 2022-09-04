# k8s-boilerplate

terraform & helm-chart boilerplate for gcloud gke with argo-cd, istio service mesh, and cert-manager

## Prerequisite

### gcloud-cli

https://cloud.google.com/sdk/docs/install?hl=ko

### kubectl

https://kubernetes.io/ko/docs/tasks/tools/

### helm

https://helm.sh/docs/intro/install/

### terraform

https://www.terraform.io/downloads

### prepare your cluster

replace `blue-hope-cluster` to yours

### prepare your domain

replace `argo-cd.yourdomain.com` to yours

## Run

### terraform

`$ cd terraform && terraform apply`

### istio, argo-cd, cert-manager

`$ cd helm/charts/autoconfig && ./autoconfig.sh`
