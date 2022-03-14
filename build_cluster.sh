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

# kubectl_ip=$(echo $(kubectl get svc ingress-nginx-controller -n ingress-nginx -o json | jq -r '{ ip: .status.loadBalancer?|.ingress[]?|.ip  }'))
# ip=$(cut -d "\"" -f4 <<< "$kubectl_ip")
echo '

Connect on 172.25.96.162/adminer with :
server : db-service:30000
user : root
password : hello
database : test-database

and create the following table :

CREATE TABLE `identity` (
  `id` int unsigned NOT NULL,
  `name` varchar(100) NOT NULL,
  `sex` int unsigned NOT NULL,
  `age` int unsigned NOT NULL,
  `height` int unsigned NOT NULL,
  `nationality` varchar(100) NOT NULL
);

Then connect on 172.25.96.162/add and you can add data'
