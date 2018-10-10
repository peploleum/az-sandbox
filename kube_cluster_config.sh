#!/bin/sh
kubeadm init --pod-network-cidr=192.168.0.0/16


mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config


#not as root

kubectl apply -f https://docs.projectcalico.org/v3.1/getting-started/kubernetes/installation/hosted/rbac-kdd.yaml
kubectl apply -f https://docs.projectcalico.org/v3.1/getting-started/kubernetes/installation/hosted/kubernetes-datastore/calico-networking/1.7/calico.yaml

#allow pod deployment
kubectl taint nodes --all node-role.kubernetes.io/master-


#kubeadm join 10.0.0.4:6443 --token 6prlbd.ts6h7ut0bn4ergpx --discovery-token-ca-cert-hash sha256:88cc5dea2ecdddcba45dae5b614684b40d83a915fe4f55c187e335f6d24edd65