#!/bin/bash

eksctl create cluster \
--name minipaintCluster \
--version 1.17 \
--region us-west-2 \
--node-type t2.small \
--nodes 2 \
--nodes-min 1 \
--nodes-max 4 \
--managed

eksctl get cluster --name=minipaintCluster