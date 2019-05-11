#!/bin/bash

server=$1
base_dir="/var/games"
work_dir="${base_dir}"/"${server}"

mkdir -p "${work_dir}"
touch "${work_dir}"/whitelist.json
touch "${work_dir}"/permissions.json
touch "${work_dir}"/server.properties

docker run -d -h ${server} --name=${server}\
 -v "$(work_dir)":/opt/minecraft:z"\
 --network=host\
 teflontoni/minecraft-bedrockserver
