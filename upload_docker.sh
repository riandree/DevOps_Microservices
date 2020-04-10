#!/usr/bin/env bash
# This file tags and uploads an image to Docker Hub

# Assumes that an image is built via `run_docker.sh`

# Step 1:
# Create dockerpath
dockerpath=andrerieck/predictor

# Step 2:  
# Authenticate & tag
echo "Docker ID and Image: $dockerpath"
echo "Please provide password to login into Docker-Hub in order to upload $dockerpath"
docker login --username andrerieck

# Step 3:
# Push image to a docker repository
docker push $dockerpath
