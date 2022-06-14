#!/bin/bash

echo "Forwarding tunnel:9997 to local port 3000"
ssh -NR :80:localhost:3000 -p 9997 -i ~/.ssh/id_rsa root@domain.xyz

