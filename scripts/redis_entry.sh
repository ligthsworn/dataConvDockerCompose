#!/bin/bash

exec service ssh start &

exec redis-server /data/redis.conf &

while true; do sleep 1; done