FROM fedora:29

ENV NAME Bedrock-Server
ENV arc=bedrock-server-1.8.0.24.zip
ENV dlarc=https://minecraft.azureedge.net/bin-linux/${arc}
WORKDIR /opt/minecraft
VOLUME ["/opt/minecraft/permissions.json", "/opt/minecraft/server.properties", "/opt/minecraft/whitelist.json", "/opt/minecraft/worlds"]

RUN ["dnf", "-y", "upgrade"]
RUN ["dnf", "-y", "install", "unzip"]
RUN ["dnf", "clean", "all"]
RUN ["rm", "-rf", "/var/cache/dnf"]
ADD ${dlarc} ${arc}
RUN unzip ${arc}

EXPOSE 19132/udp

ENTRYPOINT ["LD_LIBRARY_PATH=. ./bedrock_server", "/bin/bash"]