#!/bin/bash
kubectl delete -f python-deployment.yaml
kubectl delete -f python-service.yaml
nerdctl -n k8s.io build -t python-script:latest .
kubectl apply -f python-deployment.yaml
kubectl apply -f python-service.yaml
kubectl -n dev get po
