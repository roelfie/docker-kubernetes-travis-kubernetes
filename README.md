# docker-kubernetes-travis-kubernetes
Project used in the Docker / Kubernetes Udemy course, to setup a CI/CD pipeline with Travis for a Kubernetes deployment.

### Starting point: `docker-compose` deployment to Elastic Beanstalk

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


