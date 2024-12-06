pod=$(kubectl get pods | grep $1 | head -1 | awk '{print $1;}')
cluster=$(kubectl config current-context)
echo "Connecting to $pod on $cluster"
kubectl exec -it $pod -- /bin/bash
