#!/bin/bash

for init in /data/config/init*; do
    bash "$init"
done

supervisord
