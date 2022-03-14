#!/bin/bash
# kubectl_ip=$(echo $(kubectl get ingress -n dev -o json | jq -r '.items[] | { ip: .status.loadBalancer?|.ingress[]?|.ip  }'))
kubectl_ip=$(echo $(kubectl get svc ingress-nginx-controller -n ingress-nginx -o json | jq -r '{ ip: .status.loadBalancer?|.ingress[]?|.ip  }'))
ip=$(cut -d "\"" -f4 <<< "$kubectl_ip")
echo $ip
# ingress_ip=$(echo ${kubectl_ip:9:14})
# echo $ingress_ip
