#!/bin/bash

managers=1
workers=2

for i in `seq 1 $managers`
do
    docker-machine create --driver virtualbox manager$i
done

for i in `seq 1 $workers`
do
    docker-machine create --driver virtualbox worker$i
done

docker-machine ls

echo "======> Initializing first swarm manager ..."
docker-machine ssh manager1 "docker swarm init --advertise-addr $(docker-machine ip manager1)"

worker_join_cmd=`docker-machine ssh manager1 "docker swarm join-token worker | grep token"`


for node in `seq 1 $workers`
do
    docker-machine ssh worker$node "$worker_join_cmd"
done