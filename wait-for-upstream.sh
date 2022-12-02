#!/bin/sh

upstream_host=php-fpm
upstream_port=9000

echo "Testing connection to upstream at ${upstream_host}:${upstream_port}"
while ! nc -z -w 1 "${upstream_host}" "${upstream_port}"; do
    echo "Waiting for upstream at ${upstream_host}:${upstream_port} to be available..."
    sleep 5
done
