kind create cluster --name=cluster01 --config=./kindCalicoIngress.yaml
kubectl apply -f https://docs.projectcalico.org/v3.8/manifests/calico.yaml
sleep 60
kubectl -n kube-system set env daemonset/calico-node FELIX_IGNORELOOSERPF=true
sleep 60
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/master/deploy/static/provider/kind/deploy.yaml
sleep 90
kubectl apply -f ./ingressDemoApp.yaml