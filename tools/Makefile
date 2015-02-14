#!/bin/bash

printf "\n\n### Building container: nematix/composer\n"
docker build --rm -t "nematix/composer" composer

echo -n "Push container? (y/n)"
read answer

if echo "$answer" | grep -iq "^y"; then
    docker push nematix/composer
fi
