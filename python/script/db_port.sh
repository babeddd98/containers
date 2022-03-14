#!/bin/bash
kubectl_nodeport=$(echo $(kubectl get svc db-service -n dev -o json | jq -r '.spec | { NodePort: .ports[]?|.nodePort  }'))
db_port=$(echo ${kubectl_nodeport:14:5})
echo $db_port