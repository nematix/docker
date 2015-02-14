#!/bin/bash

printf "\n\n### Building container: nematix/ubuntu\n"
docker build --rm -t "nematix/ubuntu" ubuntu

printf "\n\n### Building container: nematix/data\n"
docker build --rm -t "nematix/data" data

echo -n "Push container? (y/n)"
read answer

if echo "$answer" | grep -iq "^y"; then
    docker push nematix/data
    docker push nematix/ubuntu
fi
