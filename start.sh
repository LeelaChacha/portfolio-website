#!/bin/bash

docker build -t nginx-server .
docker run --restart=always -p 80:80 -p 443:443 --name my-server -d nginx-server