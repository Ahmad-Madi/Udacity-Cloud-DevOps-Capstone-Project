#!/bin/bash

sudo apt-get update &&
sudo apt-get install docker-ce docker-ce-cli containerd.io &&
docker pull hadolint/hadolint