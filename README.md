# docker-kubernetes-travis-kubernetes
Project used in the Docker / Kubernetes Udemy course, to setup a CI/CD pipeline with Travis for a Kubernetes deployment.

## Starting point: `docker-compose` deployment to Elastic Beanstalk

The starting point for this project is 
[docker-kubernetes-travis-multicontainer](https://github.com/roelfie/docker-kubernetes-travis-multicontainer).

That project showed how to deploy an application with multiple Docker containers to AWS Elastic Beanstalk with 
Travis CI using `docker-compose.yml`.

This project contains configuration to deploy the exact same application to AWS, but this time to a Kubernetes cluster.

Checking whether the application runs on localhost:
```shell
docker compose -f docker-compose-dev.yml up --build
docker compose -f docker-compose-dev.yml down
```
Fibonacci-client should be accessible on [localhost:3050](http://localhost:3050).

## Overview

We're gonna make a separate k8s config file for each of the 11 above components:
* Ingress Service
* ClusterIP Service (4x)
* Deployments (5x)
* Postgres PVC

### Rolling out a set of k8s config files

All our config files are stored in folder [k8s](./k8s). To apply all files at once, do:

```shell
kubectl apply -f k8s
```

### Combining multiple k8s config files

You can combine multiple configurations into one single file by separating them with `---`:
```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: server-deployment
spec:
  replicas: 3
  ...
---
apiVersion: v1
kind: Service
metadata:
  name: server-cluster-ip-service
...
```


