kubectl delete -f admission-service-account.yaml 
kubectl delete -f validating-webhook.yaml
kubectl delete -f jobs.yaml
kubectl delete -f ingress-service-account.yaml
kubectl delete -f configmap.yaml
kubectl delete -f services.yaml
kubectl delete -f deployment.yaml

kubectl apply -f admission-service-account.yaml 
kubectl apply -f validating-webhook.yaml
kubectl apply -f jobs.yaml
kubectl apply -f ingress-service-account.yaml
kubectl apply -f configmap.yaml
kubectl apply -f services.yaml
kubectl apply -f deployment.yaml

