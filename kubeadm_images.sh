#!/bin/bash

imagelistfile=/tmp/kubeimageslist.txt
kubeadm config images list > $imagelistfile 2> /dev/null

kube_apiserver_version=$(awk -F/ '/kube-apiserver/{print $2}' $imagelistfile)
kube_controller_manager_version=$(awk -F/ '/kube-controller-manager/{print $2}' $imagelistfile)
kube_scheduler_version=$(awk -F/ '/kube-scheduler/{print $2}' $imagelistfile)
kube_proxy_version=$(awk -F/ '/kube-proxy/{print $2}' $imagelistfile)
pause_version=$(awk -F/ '/pause/{print $2}' $imagelistfile)
etcd_version=$(awk -F/ '/etcd/{print $2}' $imagelistfile)
coredns_version=$(awk -F/ '/coredns/{print $2}' $imagelistfile)


docker pull registry.aliyuncs.com/google_containers/$kube_apiserver_version
docker pull registry.aliyuncs.com/google_containers/$kube_controller_manager_version
docker pull registry.aliyuncs.com/google_containers/$kube_scheduler_version
docker pull registry.aliyuncs.com/google_containers/$kube_proxy_version
docker pull registry.aliyuncs.com/google_containers/$pause_version
docker pull registry.aliyuncs.com/google_containers/$etcd_version
docker pull registry.aliyuncs.com/google_containers/$coredns_version


docker tag registry.aliyuncs.com/google_containers/$kube_apiserver_version k8s.gcr.io/$kube_apiserver_version
docker tag registry.aliyuncs.com/google_containers/$kube_controller_manager_version k8s.gcr.io/$kube_controller_manager_version
docker tag registry.aliyuncs.com/google_containers/$kube_scheduler_version k8s.gcr.io/$kube_scheduler_version
docker tag registry.aliyuncs.com/google_containers/$kube_proxy_version k8s.gcr.io/$kube_proxy_version
docker tag registry.aliyuncs.com/google_containers/$pause_version k8s.gcr.io/$pause_version
docker tag registry.aliyuncs.com/google_containers/$etcd_version k8s.gcr.io/$etcd_version
docker tag registry.aliyuncs.com/google_containers/$coredns_version k8s.gcr.io/$coredns_version



docker image rm registry.aliyuncs.com/google_containers/$kube_apiserver_version
docker image rm registry.aliyuncs.com/google_containers/$kube_controller_manager_version
docker image rm registry.aliyuncs.com/google_containers/$kube_scheduler_version
docker image rm registry.aliyuncs.com/google_containers/$kube_proxy_version
docker image rm registry.aliyuncs.com/google_containers/$pause_version
docker image rm registry.aliyuncs.com/google_containers/$etcd_version
docker image rm registry.aliyuncs.com/google_containers/$coredns_version
