## Cloud DevOps ND - C4- Microservices at Scale using AWS & Kubernetes - Project Assignment

This repository is the assignment associated with Cloud DevOps ND - Course 04 - Microservices at Scale using AWS & Kubernetes.

CircleCI build status : [![riandree](https://circleci.com/gh/riandree/DevOps_Microservices.svg?style=svg)](https://app.circleci.com/pipelines/github/riandree/DevOps_Microservices)

## Project Summary

This project, a python 'flask' app, builds a pre-trained, `sklearn` model that has been trained to predict housing prices in Boston according to several features, such as average rooms in a home and data about highway access, teacher-to-pupil ratios, and so on. You can read more about the data, which was initially taken from Kaggle, on [the data source site](https://www.kaggle.com/c/boston-housing). 

### CircleCI build and Docker-Image Registry on Docker-Hub

This project is automatically build as a Docker container which is pushed to Docker-Hub using CircleCI.

 [The CircleCI Pipeline](https://app.circleci.com/pipelines/github/riandree/DevOps_Microservices) lints and builds the project as a Docker-Image which is then pushed to [Docker-Hub](https://hub.docker.com/repository/docker/andrerieck/predictor).

## Setup the Environment

* Create a virtualenv and activate it
* Run `make install` to install the necessary dependencies

## Running the Prediction-Service

### Running as a local Docker Container 

Please run the script `./run_docker.sh` from within the workspace of this Git repository (Docker needs to be available).
This will build and run the Docker container for the prediction service and forward port 8000 to the prediction service.
To make a prediction against this service please then run `./make_prediction.sh` (curl needs to be available).

### Running as a pod in kubernetes

This assumes kubectl is available and configured to talk to an existing kubernetes cluster.
To deploy the prediction-serivce as a pod on the k8s cluster please run `./run_kubernetes.sh`
which will deploy the docker-image for the prediction-service *andrerieck/predictor* available on Docker-Hub 
as a pod. Local port 8000 is then forwarded to this pod and after terminating the port-forward by typing
ctrl+C the pod is deleted.

To make a prediction against this service while the port-forward is active please run `./make_prediction.sh` (curl needs to be available).
