# k3d cluster create lrandriaC

# kubectl create namespace argocd
# kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml


# connect to ArgoCD
# kubectl port-forward -n argocd svc/argocd-server 8080:443
# kubectl -n argocd get secret argocd-initial-admin-secret -o=jsonpath="{.data.password}" | base64 --decode; echo
# argocd login 127.0.0.1:8080