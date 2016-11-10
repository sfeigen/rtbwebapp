# Raise the Bar: Go Webapp
RTBGoApp
# GOAPP DOCKER KUBERNETES GCLOUD SEMAPHORE
[![Build Status](https://semaphoreci.com/api/v1/sfeigen/rtbwebapp/branches/master/badge.svg)](https://semaphoreci.com/sfeigen/rtbwebapp)

## GET KUBERNETES ON GOOGLE CLOUD SDK
```powershell
RUN IN ADMINISTRATOR
gcloud components install kubectl
```

### POSSIBLE SDK - DOCKER PROBLEM FIX
```powershell
docker ps // if error...
docker-machine env default // if error...
docker-machine regenerate-certs
docker ps // if error...
docker-machine ps
docker-machine env default
$ Run this command to configure your shell:
docker ps // should work...
```

## CREATE DOCKER CONTAINER IMAGE
A Dockerfile describes the image that you want to build. Docker container images can extend from other existing images so for this image, we’ll extend from an existing Node image.

### DOCKERFILE
```dockerfile
FROM golang:1.7.1
COPY bin/[APP] /go/bin
EXPOSE 8080
CMD ["/go/bin/[APP]"]
```

### BUILD DOCKER IMAGE
Build a docker image with the tag pointing to GCR path and :Version tag.
```powershell
docker build -t gcr.io/PROJECT_ID/PROJECT_NAME:V1 .
docker run -d -p 8080:8080 --name PROJECT_NAME gcr.io/PROJECT_ID/PROJECT_NAME:V1
```

### TEST ON LOCAL
```powershell
docker-machine ls
curl http://DOCKER_MACHINE_IP:8080
```

### CLOSE AND PUSH
```powershell
docker ps
docker stop PROJECT_NAME
gcloud docker push gcr.io/PROJECT_ID/PROJECT_NAME:VERSION
```

## CREATE KUBERNETES CLUSTER
A cluster consists of a Master API server and a set of worker VMs called Nodes.
```powershell
gcloud config set compute/zone us-central1-a
gcloud container clusters create CLUSTER_NAME
gcloud container clusters get-credentials CLUSTER_NAME
```

### CATCH: ACCESS/PRIVILAGE WRITING .KUBE PROBLEM
This is probably because Google SDK isn't running in Administrator, which it needs to write to system32.

### CATCH: CAN'T FIND PROJECT
If you get an error about a different project or one that doesn't exist via. auth warning.
```powershell
gcloud auth login
gcloud config set project PROJECT_ID
gcloud container clusters create CLUSTER_NAME
gcloud container clusters get-credentials CLUSTER_NAME
```

### CATCH: ENV VARIABLE HOME OR KUBECONFIG MUST BE SET
See CATCH: ACCESS/PRIVILAGE... above. Else, create:
```powershell
KEY: KUBECONFIG
VAL: %USERPROFILE%\.kube\config

mkdir .kube
cd .kube
echo "" > config

gcloud container clusters get-credentials CLUSTER_NAME
```

## CREATE POD DEPLOYMENT
```powershell
kubectl run POD_NAME --image=gcr.io/PROJECT_ID/PROJECT_NAME:V1 --port=8080
kubectl get deployments
```

### ALLOWING EXTERNAL TRAFFIC
```powershell
kubectl expose deployment POD_NAME --type="LoadBalancer"
# To get External IP: kubectl get services POD_NAME
# curl http://EXTERNALIP:8080
```

## SCALE UP DEPLOYMENT
```powershell
kubectl scale deployment POD_NAME --replicas=4
kubectl get deployment
kubectl get pods
```

## REBUILD PROJECT
Make a change to the go server.
```powershell

``` 

Last REBUILD
