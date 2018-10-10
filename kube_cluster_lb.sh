#!/bin/sh
#loadbalancer controller

kubectl create -f lb/mandatory.yaml
kubectl create -f lb/service-nodeport.yaml
kubectl get pods --all-namespaces -l app.kubernetes.io/name=ingress-nginx --watch