#!/bin/bash
kubectl_ip=$(echo $(kubectl get ingress -n dev -o json | jq -r '.items[] | { ip: .status.loadBalancer?|.ingress[]?|.ip  }'))
ingress_ip=$(echo ${kubectl_ip:9:14})
echo $ingress_ip
