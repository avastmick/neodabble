#!/bin/bash

# Fire up the private testnet node cluster container
# Check if container exists:
# if(docker ps -af "name=neo-privnet")
# docker run -d --name neo-privnet -p 20333-20336:20333-20336/tcp -p 30333-30336:30333-30336/tcp metachris/neo-privnet-with-gas
# else
# 	docker start neo-privnet

# Start up the local neo-python node and interact
# TODO: create a cleaner privnet image to run locally

docker pull metachris/neo-privnet-with-gas
# Create a network for the private network to run on
docker network create neo-privnet
docker run -d --name neo-privnet --net=neo-privnet -p 20333-20336:20333-20336/tcp -p 30333-30336:30333-30336/tcp metachris/neo-privnet-with-gas