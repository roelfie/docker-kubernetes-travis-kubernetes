docker build -t roelfie/fibonacci-client:latest -t roelfie/fibonacci-client:$SHA -f ./client/Dockerfile ./client
docker build -t roelfie/fibonacci-api:latest    -t roelfie/fibonacci-api:$SHA    -f ./server/Dockerfile ./server
docker build -t roelfie/fibonacci-worker:latest -t roelfie/fibonacci-worker:$SHA -f ./worker/Dockerfile ./worker

docker push roelfie/fibonacci-client:latest
docker push roelfie/fibonacci-api:latest
docker push roelfie/fibonacci-worker:latest

docker push roelfie/fibonacci-client:$SHA
docker push roelfie/fibonacci-api:$SHA
docker push roelfie/fibonacci-worker:$SHA

# Apply changes in the k8s config
kubectl apply -f k8s

# Ensure that we're deploying the most recent images
kubectl set image deployments/client-deployment client=roelfie/fibonacci-client:$SHA
kubectl set image deployments/server-deployment server=roelfie/fibonacci-api:$SHA
kubectl set image deployments/worker-deployment worker=roelfie/fibonacci-worker:$SHA

