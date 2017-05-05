#!/usr/bin/env bash

CONTAINER_ID=$1 #container id can be read via `docker ps`
docker stop $CONTAINER_ID