#!/bin/bash

server=$1

docker run -d -h ${server} --name=${server}\
 -v "/var/games/${server}/whitelist.json:/opt/minecraft/whitelist.json:z"\
 -v "/var/games/${server}/server.properties:/opt/minecraft/server.properties:z"\
 -v "/var/games/${server}/ops.json:/opt/minecraft2/ops.json:z"\
 -v "/var/games/${server}/worlds:/opt/minecraft/worlds:z"\
 --network=host\
 imetzach/minecraft-bedrockserver
