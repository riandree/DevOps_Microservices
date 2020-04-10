#!/usr/bin/env bash

# This tags and uploads an image to Docker Hub

# Step 1:
# This is your Docker ID/path
dockerpath=andrerieck/predictor

# Step 2
# Run the Docker Hub container with kubernetes
kubectl run predictor --port=80 --image=$dockerpath

# Waiting for pod to be Ready
echo "waiting for pod 'predictor' to be ready (this may take a while when the image has to be pulled)"
kubectl wait --for=condition=Ready pod/predictor

# Step 3:
# List kubernetes pods
echo 'currently running pods in default namespace'
kubectl get pod 

# Step 4:
# Forward the container port to a host
echo "Type ctrl+C to stop port-forward and delete the 'predictor' pod"
kubectl port-forward pod/predictor 8000:80

echo "deleting pod 'predictor'"
kubectl delete pod/predictor
