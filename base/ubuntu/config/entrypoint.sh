#!/bin/bash

for init in /config/init*; do
    if [ -f "${init}" ]; then
        bash "${init}"
    fi
done

supervisord -c /etc/supervisor/supervisord.conf
