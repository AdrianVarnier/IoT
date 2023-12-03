k3d cluster create lrandriaC

kubectl create namespace argocd
kubectl create namespace dev
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml

# # connect to ArgoCD
# kubectl port-forward -n argocd svc/argocd-server 8080:443
# kubectl -n argocd get secret argocd-initial-admin-secret -o=jsonpath="{.data.password}" | base64 --decode; echo
# argocd login 127.0.0.1:8080

# argocd app create wil-playground --repo https://github.com/adrianvarnier/lrandria-iot.git --path wil-argocd playground --dest-server https://kubernetes.default.svc --dest-namespace dev
# argocd app sync wil-playground
# argocd app set wil-playground --sync-policy automated
# argocd app set wil-playground --auto-prune
# argocd app set wil-playground --self-heal
# kubectl apply -f ../confs/ingress.yaml