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
base_dir="${HOME}/local/games/minecraft"
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
	touch "${work_dir}"/server.properties
	touch "${work_dir}"/permissions.json
fi
}

server_start(){
# START THE CONTAINER
docker run -d -h ${server} --name=${server}\
 -v "${work_dir}/whitelist.json:/opt/minecraft/whitelist.json:z"\
 -v "${work_dir}/server.properties:/opt/minecraft/server.properties:z"\
 -v "${work_dir}/permissions.json:/opt/minecraft/permissions.json:z"\
 -v "${work_dir}/worlds:/opt/minecraft/worlds:z"\
 --network=host\
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
