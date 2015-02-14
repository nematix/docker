#!/bin/bash

printf "\n\n### Building container: nematix/nginx\n"
docker build --rm -t "nematix/nginx" nginx

printf "\n\n### Building container: nematix/nginx-php\n"
docker build --rm -t "nematix/nginx-php" nginx-php

echo -n "Push container? (y/n)"
read answer

if echo "$answer" | grep -iq "^y"; then
    docker push nematix/nginx
    docker push nematix/nginx-php
fi
