#!/bin/bash

config="./kind1NodeDefaultConfig.yaml"

# Spin up the cluster
kind create cluster --name=cluster01 --config=$config

# Install Calico CNI
#echo "Installing Calico."
#kubectl apply -f https://docs.projectcalico.org/v3.8/manifests/calico.yaml > /dev/null
#echo "Sleeping for 60 seconds..."
#sleep 60
#echo "Updating Calico environment varaibles."
#kubectl -n kube-system set env daemonset/calico-node FELIX_IGNORELOOSERPF=true
#echo "Sleeping for 60 seconds..."
#sleep 60

# Install the KinD NGINX ingress controller
echo "Installing KinD NGINX ingress controller."
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/master/deploy/static/provider/kind/deploy.yaml > /dev/null
echo "Sleeping for 90 seconds..."
sleep 90

# Deploy the demo app
#kubectl apply -f ./ingressDemoApp.yaml

helm install --namespace=kubernetes-dashboard --create-namespace --set=protocolHttp=true dashboard kubernetes-dashboard/kubernetes-dashboard 