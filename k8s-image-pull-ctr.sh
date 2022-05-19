#!/bin/bash

imagelistfile=/tmp/kubeimageslist.txt
kubeadm config images list > $imagelistfile 2> /dev/null

kube_apiserver_version=$(awk -F/ '/kube-apiserver/{print $2}' $imagelistfile)
kube_controller_manager_version=$(awk -F/ '/kube-controller-manager/{print $2}' $imagelistfile)
kube_scheduler_version=$(awk -F/ '/kube-scheduler/{print $2}' $imagelistfile)
kube_proxy_version=$(awk -F/ '/kube-proxy/{print $2}' $imagelistfile)
pause_version=$(awk -F/ '/pause/{print $2}' $imagelistfile)
etcd_version=$(awk -F/ '/etcd/{print $2}' $imagelistfile)
coredns_version=$(awk -F/ '/coredns/{print $NF}' $imagelistfile)


ctr --namespace=k8s.io images pull registry.aliyuncs.com/google_containers/$kube_apiserver_version
ctr --namespace=k8s.io images pull registry.aliyuncs.com/google_containers/$kube_controller_manager_version
ctr --namespace=k8s.io images pull registry.aliyuncs.com/google_containers/$kube_scheduler_version
ctr --namespace=k8s.io images pull registry.aliyuncs.com/google_containers/$kube_proxy_version
ctr --namespace=k8s.io images pull registry.aliyuncs.com/google_containers/$pause_version
ctr --namespace=k8s.io images pull registry.aliyuncs.com/google_containers/$etcd_version
ctr --namespace=k8s.io images pull registry.aliyuncs.com/google_containers/coredns:latest


ctr --namespace=k8s.io images tag registry.aliyuncs.com/google_containers/$kube_apiserver_version k8s.gcr.io/$kube_apiserver_version
ctr --namespace=k8s.io images tag registry.aliyuncs.com/google_containers/$kube_controller_manager_version k8s.gcr.io/$kube_controller_manager_version
ctr --namespace=k8s.io images tag registry.aliyuncs.com/google_containers/$kube_scheduler_version k8s.gcr.io/$kube_scheduler_version
ctr --namespace=k8s.io images tag registry.aliyuncs.com/google_containers/$kube_proxy_version k8s.gcr.io/$kube_proxy_version
ctr --namespace=k8s.io images tag registry.aliyuncs.com/google_containers/$pause_version k8s.gcr.io/$pause_version
ctr --namespace=k8s.io images tag registry.aliyuncs.com/google_containers/$etcd_version k8s.gcr.io/$etcd_version
ctr --namespace=k8s.io images tag registry.aliyuncs.com/google_containers/coredns:latest k8s.gcr.io/coredns/$coredns_version



ctr --namespace=k8s.io images rm registry.aliyuncs.com/google_containers/$kube_apiserver_version
ctr --namespace=k8s.io images rm registry.aliyuncs.com/google_containers/$kube_controller_manager_version
ctr --namespace=k8s.io images rm registry.aliyuncs.com/google_containers/$kube_scheduler_version
ctr --namespace=k8s.io images rm registry.aliyuncs.com/google_containers/$kube_proxy_version
ctr --namespace=k8s.io images rm registry.aliyuncs.com/google_containers/$pause_version
ctr --namespace=k8s.io images rm registry.aliyuncs.com/google_containers/$etcd_version
ctr --namespace=k8s.io images rm registry.aliyuncs.com/google_containers/coredns:latest
