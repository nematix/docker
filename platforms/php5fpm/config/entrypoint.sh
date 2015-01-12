#!/bin/bash

if [ -z "$LISTEN" ]; then
    echo "Listen value is invalid"
else
    sed -i "s/%fpm-ip%/$FPM_PORT_9000_TCP_ADDR/" /etc/nginx/nginx.conf
fi

/usr/sbin/php5-fpm
