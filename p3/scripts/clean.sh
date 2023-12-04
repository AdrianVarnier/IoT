#!/bin/sh

if [ -f kubectl_port_forward.pid ]; then
    pid=$(cat kubectl_port_forward.pid)
    if ps -p $pid > /dev/null; then
        kill $pid
        rm kubectl_port_forward.pid
    fi
fi

kubectl delete namespace argocd
kubectl delete namespace dev
k3d cluster delete lrandriaC
docker stop $(docker ps -aq)
docker system prune -af --volumes