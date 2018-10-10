#!/bin/sh
#loadbalancer controller

kubectl create -f https://github.com/kubernetes/ingress-gce/blob/master/examples/deployment/gce-ingress-controller.yaml
kubectl get po -l name=glbc