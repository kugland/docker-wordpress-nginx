#!/bin/sh
sed -Ei -e '/^nginx:/{s,:101:101:,:'${DAEMON_UID:-1000}:${DAEMON_GID:-1000}':,}' /etc/passwd* ;
sed -Ei -e '/^nginx:/{s,:101:,:'${DAEMON_GID:-1000}':,g}' /etc/group* ;
