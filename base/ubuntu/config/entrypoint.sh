#!/bin/bash

# Run all init file in config path
for init in /config/init*; do
    if [ -f "${init}" ]; then
        bash "${init}"
    fi
done

# Run supervisor in foreground
supervisord -c /etc/supervisor/supervisord.conf
