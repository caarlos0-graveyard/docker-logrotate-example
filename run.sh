#!/bin/sh
echo "Starting up..."
crond
while true; do
    echo "working" | tee -a /var/log/app.log
    sleep 1
done
