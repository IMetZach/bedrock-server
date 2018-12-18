FROM fedora:29

ENV dlarc=https://minecraft.azureedge.net/bin-linux/bedrock-server-1.8.0.24.zip
ENV arc=bedrock-server.zip
WORKDIR /opt/minecraft

RUN ["dnf", "-y", "upgrade"]
RUN ["dnf", "-y", "install", "unzip"]
RUN ["curl", ${dlarc}, "-o", ${arc}]
RUN ["unzip", ${arc}]

VOLUME ["/opt/minetcraft/permissions.json", "/opt/minecraft/server.properties", "/opt/minecraft/whitelist.json", "/opt/minecraft/worlds"]
EXPOSE 19132/udp

ENTRYPOINT [ "LD_LIBRARY_PATH=. ./bedrock_server", "/bin/bash"]