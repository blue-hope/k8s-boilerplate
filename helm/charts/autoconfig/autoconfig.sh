#!/bin/sh

# Regular Colors
Black='\033[0;30m'        # Black
Red='\033[0;31m'          # Red
Green='\033[0;32m'        # Green
Yellow='\033[0;33m'       # Yellow
Blue='\033[0;34m'         # Blue
Purple='\033[0;35m'       # Purple
Cyan='\033[0;36m'         # Cyan
White='\033[0;37m'        # White
Nc='\033[0m'

echo -e "${Green}================================="
echo -e "AutoConfigure Start"
echo -e "=================================${Nc}\n"

echo -e "${Green}1. Gcloud Container ${Nc}\n"

gcloud container clusters get-credentials blue-hope-cluster --region asia-northeast3

echo -e "\n${Green}2. Helm ${Nc}\n"

~/get_helm.sh

echo -e "\n${Green}2. Namespaces ${Nc}\n"

find ./namespaces -name "*.yaml" | while read fname; do
  echo $fname
  kubectl create -f $fname
done

echo -e "\n${Green}3. Istiod ${Nc}\n"

helm install istio-base istio/base -n istio-system
helm install istiod istio/istiod -n istio-system -f ./istiod/values.yaml --wait

echo -e "\n${Green}4. Cert Manager ${Nc}\n"

helm install cert-manager jetstack/cert-manager -n cert-manager --set installCRDs=true --wait
kubectl apply -f ./cert-manager/issuer.yaml
kubectl apply -f ./cert-manager/certificate.yaml

echo -e "\n${Green}5. Istio Api Gateway ${Nc}\n"

helm install istio-ingressgateway istio/gateway -n istio-ingress --wait
kubectl apply -f ./virtualservices/gateway.yaml
kubectl apply -f ./virtualservices/argo-cd.yaml

echo -e "\n${Green}5. Argo CD ${Nc}\n"

helm install argo argo/argo-cd -n argo-cd -f ./argo-cd/values.yaml --wait

echo -e "\n${Green}================================="
echo -e "AutoConfigure Finished~!"
echo -e "=================================${Nc}\n"