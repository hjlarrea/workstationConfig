# WSL Ubuntu Configuration

The idea of this document is to collect all the configurations I use in WSL (Ubuntu 18.04).

## Docker CLI

Install requirements and configure docker cli to talk with the Docker for Desktop instance installed on Windows 10.

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

From: [https://devblogs.microsoft.com/commandline/cross-post-wsl-interoperability-with-docker/](https://devblogs.microsoft.com/commandline/cross-post-wsl-interoperability-with-docker/)

### Running docker-relay:

1. Start Docker for Windows
1. Make sure `sudo` has your credential cached by running something like `sudo ls`. Otherwhise the next command won't work as it will start docker-relay as a job and if it would need to prompt for the user password the job would be paused.
1. Right after that run `sudo ./docker-relay &`

## kubectl

Install kubectl:

```bash
curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl \
&& chmod +x ./kubectl \
&& sudo mv ./kubectl /usr/local/bin/kubectl
```

## Add to .bashrc

Add the following configurations to the .bashrc file in the home directory:

```bash
#
# My Configs
#

# Execute
cd ~

# Aliases
alias python=python3
alias pip=pip3
alias kk=kubectl
```