#!/bin/bash
# WHO: @imetzach
# WHAT: Deploy a containerized server of Minecraft Bedrock Edition
# WHERE: https://github.com/IMetZach/bedrock-server

################################
####        VARIABLES       ####
################################
mode=$1
server=$2
server_image="docker.io/imetzach/bedrock-server:latest"
base_dir="${HOME}/local/minecraft"
work_dir="${base_dir}"/"${server}"

################################
####        FUNCTIONS       ####
################################
check_server(){
# MAKE THE DIRECTORY AND FILES
if [ -d ${work_dir} ]
	then
	printf "Server directory already exists\n"
	else
	printf "Creating World Directory and Files\n"
	mkdir -p "${work_dir}/worlds"
	touch "${work_dir}"/whitelist.json
	printf "gamemode=survival\n
difficulty=normal\n
level-type=default\n
server-name=${server}\n
max-players=10\n
server-port=19132\n
server-portv6=19133\n
level-name=${server}\n
level-seed=\n
online-mode=true\n
white-list=true\n
allow-cheats=false\n
view-distance=32\n
player-idle-timeout=30\n
max-threads=8\n
tick-distance=4\n
default-player-permission-level=member\n
texturepack-required=false" >> "${work_dir}"/server.properties 

	touch "${work_dir}"/permissions.json
fi
}

server_start(){
# START THE CONTAINER
docker create -h ${server} --name=${server} -it\
 -v "${work_dir}/whitelist.json:/opt/minecraft/whitelist.json:z"\
 -v "${work_dir}/server.properties:/opt/minecraft/server.properties:z"\
 -v "${work_dir}/permissions.json:/opt/minecraft/permissions.json:z"\
 -v "${work_dir}/worlds:/opt/minecraft/worlds:z"\
 --network=host\
 --label "io.containers.autoupdate=image"\
 ${server_image}
}

server_update(){
docker pull ${server_image}
docker restart ${server}
}

################################
####       MAIN SCRIPT      ####
################################
case ${mode} in
	--start)
		check_server
		server_start
		;;
	--upgrade)
		server_update
		;;
	*)
		printf "Usage: $0 [option] <server name>\n"
		printf "Options:\n"
		printf "\t --start: Start a new server\n"
		printf "\t --upgrade: Upgrade and restart an existing server\n"
		;;
esac
