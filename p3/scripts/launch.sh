k3d cluster create lrandriaC --port "8081:80@loadbalancer"

sudo kubectl create namespace argocd
sudo kubectl create namespace dev

kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml

argocd app create wil-playground \
  --repo https://github.com/adrianvarnier/lrandria-iot.git \
  --path will-playground \
  --dest-server https://kubernetes.default.svc \
  --dest-namespace dev

argocd app sync wil-playground
argocd app set wil-playground --sync-policy automated
argocd app set wil-playground --auto-prune
argocd app set wil-playground --self-heal
