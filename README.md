## Cloud DevOps ND - C4- Microservices at Scale using AWS & Kubernetes - Project Assignment

This repository is the assignment associated with Cloud DevOps ND - Course 04 - Microservices at Scale using AWS & Kubernetes.

CircleCI build status : [![riandree](https://circleci.com/gh/riandree/DevOps_Microservices.svg?style=svg)](https://app.circleci.com/pipelines/github/riandree/DevOps_Microservices)

## Project Summary

This project, a python 'flask' app, builds a pre-trained, `sklearn` model that has been trained to predict housing prices in Boston according to several features, such as average rooms in a home and data about highway access, teacher-to-pupil ratios, and so on. You can read more about the data, which was initially taken from Kaggle, on [the data source site](https://www.kaggle.com/c/boston-housing). 

### CircleCI build and Docker-Image Registry on Docker-Hub

This project is automatically build as a Docker container which is pushed to Docker-Hub using CircleCI.

 [The CircleCI Pipeline](https://app.circleci.com/pipelines/github/riandree/DevOps_Microservices) lints and builds the project as a Docker-Image which is then pushed to [Docker-Hub](https://hub.docker.com/repository/docker/andrerieck/predictor).

## Setup the Environment for development

### Create a virtualenv and activate it

It is assumed that python3, [hadolint](https://github.com/hadolint/hadolint) and [pylint](https://www.pylint.org/) are installed and that the '.devops' Virtual-Env is active.

In order to activate the *devops* environment please run

    python3 -m venv ~/.devops
    source ~/.devops/bin/activate
    
    or use: make setup

Then while the virtual environment is active please run `make install` to install the projects python dependencies.

## Running the Prediction-Service

### Running the app locally without using docker

This might be useful for development. Please run `make run` while the *devops* virtual env is active to start the service on port 8000.
To make a prediction against this service while the app isrunning please use `./make_prediction.sh` (curl needs to be available).

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

# Description of the project files

- .circleci directory containing the yaml file that defines the CircleCI Pipeline
-	model_data directory containing the data on which the prediction service is based
- output_txt_files log data required for this assignment
- Dockerfile used to build the containerised version of this service
-	Makefile used to automate project setup and linting
-	app.py python code using the pretrained model from *model_data* to predict housing prices
- make_prediction.sh script used to invoke the prediction service via http
-	requirements.txt defined the required python dependencies (necessary for make install)
-	run_docker.sh script that builds and starts the project as a docker container
-	run_kubernetes.sh deploys this projects docker container to a k8s cluster
- upload_docker.sh script used to upload the locally build docker image to Docker-Hub.
