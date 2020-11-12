#!/bin/bash

eksctl create cluster \
--name minipaintCluster \
--version 1.17 \
--region us-west-2 \
--node-type t2.micro \
--nodes 2 \
--nodes-min 1 \
--nodes-max 3 \
--managed
