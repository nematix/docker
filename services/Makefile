#!/bin/bash

printf "\n\n### Building container: nematix/mariadb\n"
docker build --rm -t "nematix/mariadb" mariadb

printf "\n\n### Building container: nematix/redis\n"
docker build --rm -t "nematix/redis" redis

printf "\n\n### Building container: nematix/riak\n"
docker build --rm -t "nematix/riak" riak

echo -n "Push container? (y/n)"
read answer

if echo "$answer" | grep -iq "^y"; then
    docker push nematix/mariadb
    docker push nematix/redis
    docker push nematix/riak
fi
