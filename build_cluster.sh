#!/bin/bash
cd database
kubectl delete -f db-deployment.yaml
kubectl delete -f db-service.yaml
kubectl apply -f db-deployment.yaml
kubectl apply -f db-service.yaml

cd .. && cd python

kubectl delete -f python-deployment.yaml
kubectl delete -f python-service.yaml
nerdctl -n k8s.io build -t python-script:latest .
kubectl apply -f python-deployment.yaml
kubectl apply -f python-service.yaml
kubectl -n dev get po

cd .. && cd ingress-controller

kubectl delete -f ingress.yaml
kubectl apply -f ingress.yaml
