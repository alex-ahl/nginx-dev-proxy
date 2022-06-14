#!/bin/bash

PORT=$1

REMOTE_PORT={REMOTE_PORT}
DOMAIN={DOMAIN}

echo "Forwarding $DOMAIN with PORT $REMOTE_PORT to local port $PORT"
ssh -NR :80:localhost:$PORT -p $REMOTE_PORT  -i ~/.ssh/id_rsa root@$DOMAIN

