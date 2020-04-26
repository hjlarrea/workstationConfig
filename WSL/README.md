# dockerForWindowsK8S
Enabling and testing Kubernetes in Docker for Windows

https://devblogs.microsoft.com/commandline/cross-post-wsl-interoperability-with-docker/

```bash
sudo wget https://storage.googleapis.com/golang/go1.9.2.linux-amd64.tar.gz
sudo tar -C /usr/local -xzf go1.9.2.linux-amd64.tar.gz
export PATH=$PATH:/usr/local/go/bin
go get -d github.com/jstarks/npiperelay
GOOS=windows go build -o /mnt/c/Users/<your_user_name>/go/bin/npiperelay.exe github.com/jstarks/npiperelay
sudo ln -s /mnt/c/Users/<your_user_name>/go/bin/npiperelay.exe /usr/local/bin/npiperelay.exe
sudo apt-get install socat
sudo apt-get install docker.io
touch ~/docker-relay
chmod +x ~/docker-relay
printf '#!/bin/sh\nexec socat UNIX-LISTEN:/var/run/docker.sock,fork,group=docker,umask=007 EXEC:"npiperelay.exe -ep -s //./pipe/docker_engine",nofork' > ~/docker-relay
sudo adduser <your WSL user> docker
```

Install kubectl:

```bash
curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl \
&& chmod +x ./kubectl \
&& sudo mv ./kubectl /usr/local/bin/kubectl
```

https://dev.to/zeerorg/develop-with-kubernetes-on-docker-desktop-with-wsl-21mh

## Based on 
https://github.com/Azure-Samples/azure-voting-app-redis
https://enmilocalfunciona.io/instalando-y-probando-kubernetes-windows-10/
https://github.com/kubernetes/dashboard/tree/v1.10.1/src/deploy/recommended





https://docs.nginx.com/nginx-ingress-controller/installation/installation-with-manifests/#