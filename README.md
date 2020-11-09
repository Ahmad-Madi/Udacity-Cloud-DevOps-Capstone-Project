# Udacity Cloud DevOps Capstone Project

## Project description:
Creating a highly available microservice deployed on a Kubernetes cluster of 2 nodes automatically using Jenkins pipeline.

## Project details:
In this project, I [cloned](https://github.com/viliusle/miniPaint) an open source photo editor website, containerized it with a Dockerfile and then pushed it to [Docker hub](https://hub.docker.com/repository/docker/sahlmady/minipaint/general), then created a Jenkins pipeline that automates the deployment using CI/CD techniques starting from pushing to GitHub repo to the final deployment without a downtime.

## Project Rubric:
1. Set Up Pipeline:
  a. Create GitHub repository with project code ✔
  b. Use image repository to store Docker images -> [Here](https://hub.docker.com/repository/docker/sahlmady/minipaint/general) ✔

2. Build Docker Container
  a. Execute linting step in code pipeline -> Stage #2 in Jenkinsfile ✔
  b. Build a Docker container in a pipeline -> Stage #3 in Jenkinsfile ✔

3. Successful Deployment
  a. The Docker container is deployed to a Kubernetes cluster -> deployed and [this](http://a03dd4fa793f44147aa6e50ad095bc1d-1685300544.us-west-2.elb.amazonaws.com/) is the public URL(*temp*) ✔
  b. Use Blue/Green Deployment or a Rolling Deployment successfully -> used rolling as described in the deployment.yml file ✔
