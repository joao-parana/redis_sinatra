#!/bin/bash

set -e

echo "••• `date` - Iniciando o REDIS •••"

nohup redis-server &

/opt/webapp/bin/webapp # /usr/local/etc/redis/redis.conf
